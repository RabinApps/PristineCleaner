import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/models/file_item.dart';
import '../core/models/removal_models.dart';
import '../core/models/scan_result.dart';
import '../core/models/space_view_snapshot.dart';
import '../services/file_service.dart';
import '../services/trash_service.dart';
import '../core/models/scan_view_model.dart';

final spaceViewProvider = NotifierProvider<SpaceViewNotifier, ScanViewModel>(
  SpaceViewNotifier.new,
);

class SpaceViewNotifier extends Notifier<ScanViewModel> {
  SpaceViewSnapshot? _snapshot;

  @override
  ScanViewModel build() {
    final root = _defaultRootPath();
    return ScanViewModel(
      selectedParentPath: root,
      selectedParentName: _pathLabel(root),
      currentPath: root,
      currentName: _pathLabel(root),
      breadcrumbs: [root],
    );
  }

  Future<void> scan() async {
    final root = state.selectedParentPath ?? _defaultRootPath();
    state = state.copyWith(
      isScanning: true,
      progressPercent: 0,
      progressLabel: 'Counting folders...',
      isDone: false,
      clearResult: true,
      clearError: true,
      currentPath: root,
      currentName: _pathLabel(root),
      breadcrumbs: [root],
    );
    try {
      final snapshot = await ref
          .read(fileServiceProvider)
          .scanSpaceViewSnapshot(
            root,
            topFolderLimit: 30,
            onProgress: _onProgress,
          );
      _snapshot = snapshot;
      final folders = snapshot.topFolders;
      final totalBytes = folders.fold<int>(0, (s, f) => s + f.sizeBytes);
      final result = ScanResult(
        items: folders,
        totalBytes: totalBytes,
        scanDuration: Duration.zero,
      );
      state = state.copyWith(
        isScanning: false,
        result: result,
        clearProgress: true,
        clearError: true,
      );
    } on ScanCancelledException {
      _snapshot = null;
      state = state.copyWith(
        isScanning: false,
        clearProgress: true,
        clearResult: true,
      );
    } catch (e) {
      _snapshot = null;
      state = state.copyWith(
        isScanning: false,
        clearProgress: true,
        error: e.toString(),
      );
    }
  }

  void _onProgress(ScanProgress progress) {
    final label = progress.phase == ScanPhase.counting
        ? 'Counting folders...'
        : progress.percentLabel;
    state = state.copyWith(
      isScanning: true,
      progressPercent: progress.percent,
      progressLabel: label,
      clearError: true,
    );
  }

  void toggleItem(int index) => state = state.withToggled(index);
  void selectAll() => state = state.withAllSelected(true);
  void deselectAll() => state = state.withAllSelected(false);

  void stop() => ref.read(fileServiceProvider).cancelActiveScan();

  Future<void> setParentFolder(String path) async {
    final cleanPath = path.trim();
    if (cleanPath.isEmpty) return;
    final name = _pathLabel(cleanPath);
    state = state.copyWith(
      selectedParentPath: cleanPath,
      selectedParentName: name,
      currentPath: cleanPath,
      currentName: name,
      breadcrumbs: [cleanPath],
      isDone: false,
      clearResult: true,
      clearError: true,
      clearProgress: true,
    );
    _snapshot = null;
  }

  Future<void> navigateIntoFolder(FileItem item) async {
    if (!item.isDirectory) return;
    final currentPath = state.currentPath;
    if (currentPath == null) return;

    final nextTrail = [...state.breadcrumbs];
    if (nextTrail.isEmpty) {
      nextTrail.add(currentPath);
    }
    if (nextTrail.last != item.path) {
      nextTrail.add(item.path);
    }
    await _loadDirectory(
      path: item.path,
      trail: nextTrail,
      focusName: item.name,
    );
  }

  Future<void> navigateToBreadcrumb(int index) async {
    if (index < 0 || index >= state.breadcrumbs.length) return;
    final nextTrail = state.breadcrumbs.take(index + 1).toList(growable: false);
    final path = nextTrail.last;
    await _loadDirectory(path: path, trail: nextTrail);
  }

  Future<void> refreshCurrentFolder() async {
    final path = state.currentPath;
    if (path == null || path.isEmpty) return;
    await _loadDirectory(path: path, trail: state.breadcrumbs);
  }

  Future<List<FileItem>> listDirectoryContents(String path) {
    return ref.read(fileServiceProvider).listDirectoryContents(path);
  }

  Future<void> clean() async {
    final selected = state.result?.selectedItems ?? [];
    if (selected.isEmpty) return;
    state = state.copyWith(isCleaning: true, clearError: true);
    try {
      _snapshot = null;
      await ref.read(trashServiceProvider).deleteItems(selected);
      final root = state.selectedParentPath ?? _defaultRootPath();
      state = ScanViewModel(
        isDone: true,
        selectedParentPath: root,
        selectedParentName: _pathLabel(root),
        currentPath: root,
        currentName: _pathLabel(root),
        breadcrumbs: [root],
      );
    } catch (e) {
      state = state.copyWith(isCleaning: false, error: e.toString());
    }
  }

  void applyRemovalOutcome(RemovalOutcome outcome) {
    final current = state.result;
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
    );

    // A removal mutates the filesystem; drop the cached snapshot to avoid stale
    // folder trees during subsequent navigation.
    _snapshot = null;
  }

  Future<void> _loadDirectory({
    required String path,
    required List<String> trail,
    String? focusName,
  }) async {
    state = state.copyWith(isScanning: true, clearError: true);
    try {
      final snapshot = _snapshot;
      final items = snapshot == null
          ? await ref.read(fileServiceProvider).listDirectoryContents(path)
          : snapshot.childrenFor(path);
      final totalBytes = items.fold<int>(0, (s, f) => s + f.sizeBytes);
      state = state.copyWith(
        isScanning: false,
        result: ScanResult(
          items: items,
          totalBytes: totalBytes,
          scanDuration: Duration.zero,
        ),
        currentPath: path,
        currentName: focusName ?? _pathLabel(path),
        breadcrumbs: trail,
        clearProgress: true,
      );
    } catch (e) {
      state = state.copyWith(
        isScanning: false,
        clearProgress: true,
        error: e.toString(),
      );
    }
  }

  void reset() {
    _snapshot = null;
    final root = _defaultRootPath();
    state = ScanViewModel(
      selectedParentPath: root,
      selectedParentName: _pathLabel(root),
      currentPath: root,
      currentName: _pathLabel(root),
      breadcrumbs: [root],
    );
  }

  String _defaultRootPath() {
    if (Platform.isWindows) {
      final home = Platform.environment['USERPROFILE'];
      if (home != null && home.length >= 3 && home[1] == ':') {
        return '${home.substring(0, 2)}\\';
      }
      return 'C:\\';
    }
    return '/';
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
