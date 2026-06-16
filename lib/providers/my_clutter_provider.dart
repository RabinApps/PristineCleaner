import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pristine_cleaner/gen/strings.g.dart';

import '../core/models/file_item.dart';
import '../core/models/removal_models.dart';
import '../core/models/scan_result.dart';
import '../services/file_service.dart';
import '../services/trash_service.dart';
import '../core/models/scan_view_model.dart';

class MyClutterState {
  final ScanViewModel vm;

  const MyClutterState({this.vm = const ScanViewModel()});

  MyClutterState copyWith({ScanViewModel? vm}) =>
      MyClutterState(vm: vm ?? this.vm);
}

final myClutterProvider = NotifierProvider<MyClutterNotifier, MyClutterState>(
  MyClutterNotifier.new,
);

class MyClutterNotifier extends Notifier<MyClutterState> {
  static const _stageLargeFiles = 'large_files';
  static const _stageDuplicates = 'duplicates';
  static const _stageSimilarImages = 'similar_images';
  static const _globalScanLabel = 'Scanning your files...';

  int _scanRunId = 0;

  @override
  MyClutterState build() {
    final root = _defaultProjectRoot();
    return MyClutterState(
      vm: ScanViewModel(
        selectedParentPath: root,
        selectedParentName: _pathLabel(root),
      ),
    );
  }

  Future<void> setParentFolder(String path) async {
    final cleanPath = path.trim();
    if (cleanPath.isEmpty) return;
    state = state.copyWith(
      vm: state.vm.copyWith(
        selectedParentPath: cleanPath,
        selectedParentName: _pathLabel(cleanPath),
        clearError: true,
        clearResult: true,
        clearProgress: true,
      ),
    );
  }

  Future<void> scan() async {
    final runId = ++_scanRunId;
    final root = state.vm.selectedParentPath ?? _defaultProjectRoot();
    final stageProgress = <String, double>{
      _stageLargeFiles: 0,
      _stageDuplicates: 0,
      _stageSimilarImages: 0,
    };

    state = state.copyWith(
      vm: state.vm.copyWith(
        isScanning: true,
        progressPercent: 0,
        progressLabel: _globalScanLabel,
        clearResult: true,
        clearError: true,
        isDone: false,
      ),
    );
    try {
      final svc = ref.read(fileServiceProvider);
      final results = await Future.wait<ScanResult>([
        svc.scanLargeFiles(
          root,
          onProgress: (p) => _onStageProgress(
            progress: p,
            stageKey: _stageLargeFiles,
            runId: runId,
            stageProgress: stageProgress,
          ),
        ),
        svc.scanFreshDuplicates(
          root,
          freshWindow: const Duration(days: 36500),
          onProgress: (p) => _onStageProgress(
            progress: p,
            stageKey: _stageDuplicates,
            runId: runId,
            stageProgress: stageProgress,
          ),
        ),
        svc.scanLargeSimilarImages(
          root,
          onProgress: (p) => _onStageProgress(
            progress: p,
            stageKey: _stageSimilarImages,
            runId: runId,
            stageProgress: stageProgress,
          ),
        ),
      ], eagerError: true);

      final merged = _mergeScanResults(results);
      state = state.copyWith(
        vm: state.vm.copyWith(
          isScanning: false,
          result: merged,
          clearProgress: true,
          clearError: true,
        ),
      );
    } on ScanCancelledException {
      state = state.copyWith(
        vm: state.vm.copyWith(
          isScanning: false,
          clearProgress: true,
          clearResult: true,
        ),
      );
    } catch (e) {
      ref.read(fileServiceProvider).cancelActiveScan();
      state = state.copyWith(
        vm: state.vm.copyWith(
          isScanning: false,
          clearProgress: true,
          error: e.toString(),
        ),
      );
    }
  }

  void _onStageProgress({
    required ScanProgress progress,
    required String stageKey,
    required int runId,
    required Map<String, double> stageProgress,
  }) {
    if (runId != _scanRunId || !state.vm.isScanning) {
      return;
    }

    stageProgress[stageKey] = progress.percent;
    final total = stageProgress.values.fold<double>(0, (sum, p) => sum + p);
    final percent = total / stageProgress.length;
    final progressLabel = progress.phase == ScanPhase.counting
        ? _globalScanLabel
        : '$_globalScanLabel ${((percent * 100).clamp(0, 100)).toStringAsFixed(0)}%';
    state = state.copyWith(
      vm: state.vm.copyWith(
        isScanning: true,
        progressPercent: percent.clamp(0.0, 1.0),
        progressLabel: progressLabel,
        clearError: true,
      ),
    );
  }

  ScanResult _mergeScanResults(List<ScanResult> results) {
    final byPath = <String, FileItem>{};
    var durationMs = 0;

    for (final result in results) {
      durationMs += result.scanDuration.inMilliseconds;
      for (final item in result.items) {
        final existing = byPath[item.path];
        if (existing == null) {
          final withCategory = item.category == null
              ? item.copyWith(category: 'large_files')
              : item;
          byPath[item.path] = withCategory;
          continue;
        }

        byPath[item.path] = existing.copyWith(
          isSelected: existing.isSelected || item.isSelected,
          category: existing.category ?? item.category,
          group: existing.group ?? item.group,
        );
      }
    }

    final items = byPath.values.toList(growable: false)
      ..sort((a, b) => b.sizeBytes.compareTo(a.sizeBytes));
    final total = items.fold<int>(0, (sum, i) => sum + i.sizeBytes);
    return ScanResult(
      items: items,
      totalBytes: total,
      scanDuration: Duration(milliseconds: durationMs),
    );
  }

  void toggleItem(int index) {
    state = state.copyWith(vm: state.vm.withToggled(index));
  }

  void selectAll() =>
      state = state.copyWith(vm: state.vm.withAllSelected(true));
  void deselectAll() =>
      state = state.copyWith(vm: state.vm.withAllSelected(false));

  void setSelectionForIndexes(Iterable<int> indexes, bool isSelected) {
    final result = state.vm.result;
    if (result == null) return;

    final items = List<FileItem>.from(result.items);
    for (final index in indexes) {
      if (index < 0 || index >= items.length) continue;
      items[index] = items[index].copyWith(isSelected: isSelected);
    }

    state = state.copyWith(
      vm: state.vm.copyWith(result: result.withUpdatedItems(items)),
    );
  }

  void stop() => ref.read(fileServiceProvider).cancelActiveScan();

  Future<void> clean() async {
    final selected = state.vm.result?.selectedItems ?? [];
    if (selected.isEmpty) return;
    state = state.copyWith(
      vm: state.vm.copyWith(isCleaning: true, clearError: true),
    );
    try {
      final errors = await ref.read(trashServiceProvider).deleteItems(selected);
      if (errors.isEmpty) {
        state = state.copyWith(vm: const ScanViewModel(isDone: true));
      } else {
        state = state.copyWith(
          vm: state.vm.copyWith(
            isCleaning: false,
            error: t.errors.itemsFailedToRemove.replaceAll(
              '{count}',
              '${errors.length}',
            ),
          ),
        );
      }
    } catch (e) {
      state = state.copyWith(
        vm: state.vm.copyWith(isCleaning: false, error: e.toString()),
      );
    }
  }

  void applyRemovalOutcome(RemovalOutcome outcome) {
    final current = state.vm.result;
    if (current == null) return;

    final deletedPaths = outcome.deletedItems.map((item) => item.path).toSet();
    final remaining = current.items
        .where((item) => !deletedPaths.contains(item.path))
        .toList(growable: false);
    final totalBytes = remaining.fold<int>(
      0,
      (sum, item) => sum + item.sizeBytes,
    );

    state = state.copyWith(
      vm: state.vm.copyWith(
        result: ScanResult(
          items: remaining,
          totalBytes: totalBytes,
          scanDuration: current.scanDuration,
        ),
        isCleaning: false,
        error: outcome.errors.isEmpty
            ? null
            : '${outcome.errors.length} item(s) failed to remove.',
        clearError: outcome.errors.isEmpty,
      ),
    );
  }

  void reset() {
    final root = state.vm.selectedParentPath ?? _defaultProjectRoot();
    state = MyClutterState(
      vm: ScanViewModel(
        selectedParentPath: root,
        selectedParentName: _pathLabel(root),
      ),
    );
  }

  String _defaultProjectRoot() {
    if (Platform.isWindows) {
      return Platform.environment['USERPROFILE'] ?? r'C:\';
    }
    return Platform.environment['HOME'] ?? '/';
  }

  String _pathLabel(String path) {
    if (path == '/' || path == '\\' || path.endsWith(':\\')) {
      return path;
    }
    final normalized = path
        .replaceAll('\\', Platform.pathSeparator)
        .replaceAll('/', Platform.pathSeparator);
    final parts = normalized
        .split(Platform.pathSeparator)
        .where((p) => p.isNotEmpty);
    return parts.isEmpty ? path : parts.last;
  }
}
