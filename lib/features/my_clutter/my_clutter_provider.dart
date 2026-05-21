import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/scan_result.dart';
import '../../core/services/file_service.dart';
import '../../core/services/trash_service.dart';
import '../shared/scan_view_model.dart';

enum ClutterType { largeFiles, downloads }

class MyClutterState {
  final ClutterType activeType;
  final ScanViewModel vm;

  const MyClutterState({
    this.activeType = ClutterType.largeFiles,
    this.vm = const ScanViewModel(),
  });

  MyClutterState copyWith({ClutterType? activeType, ScanViewModel? vm}) {
    return MyClutterState(
      activeType: activeType ?? this.activeType,
      vm: vm ?? this.vm,
    );
  }
}

final myClutterProvider = NotifierProvider<MyClutterNotifier, MyClutterState>(
  MyClutterNotifier.new,
);

class MyClutterNotifier extends Notifier<MyClutterState> {
  @override
  MyClutterState build() => const MyClutterState();

  void setType(ClutterType type) {
    state = state.copyWith(activeType: type, vm: const ScanViewModel());
  }

  Future<void> scan() async {
    final countingLabel = state.activeType == ClutterType.largeFiles
        ? 'Counting files...'
        : 'Counting downloads...';
    state = state.copyWith(
      vm: ScanViewModel(
        isScanning: true,
        progressPercent: 0,
        progressLabel: countingLabel,
      ),
    );
    try {
      final svc = ref.read(fileServiceProvider);
      final home =
          Platform.environment[Platform.isWindows ? 'USERPROFILE' : 'HOME'] ??
          '';
      final result = state.activeType == ClutterType.largeFiles
          ? await svc.scanLargeFiles(home, onProgress: _onProgress)
          : await svc.scanDownloads(onProgress: _onProgress);
      state = state.copyWith(vm: ScanViewModel(result: result));
    } on ScanCancelledException {
      state = state.copyWith(vm: const ScanViewModel());
    } catch (e) {
      state = state.copyWith(vm: ScanViewModel(error: e.toString()));
    }
  }

  void _onProgress(ScanProgress progress) {
    final countingLabel = state.activeType == ClutterType.largeFiles
        ? 'Counting files...'
        : 'Counting downloads...';
    final label = progress.phase == ScanPhase.counting
        ? countingLabel
        : '${progress.percentLabel} (${progress.processed}/${progress.total})';
    state = state.copyWith(
      vm: state.vm.copyWith(
        isScanning: true,
        progressPercent: progress.percent,
        progressLabel: label,
        clearError: true,
      ),
    );
  }

  void toggleItem(int index) {
    state = state.copyWith(vm: state.vm.withToggled(index));
  }

  void selectAll() =>
      state = state.copyWith(vm: state.vm.withAllSelected(true));
  void deselectAll() =>
      state = state.copyWith(vm: state.vm.withAllSelected(false));

  void stop() => ref.read(fileServiceProvider).cancelActiveScan();

  Future<void> clean() async {
    final selected = state.vm.result?.selectedItems ?? [];
    if (selected.isEmpty) return;
    state = state.copyWith(
      vm: state.vm.copyWith(isCleaning: true, clearError: true),
    );
    try {
      await ref.read(trashServiceProvider).deleteItems(selected);
      state = state.copyWith(vm: const ScanViewModel(isDone: true));
    } catch (e) {
      state = state.copyWith(
        vm: state.vm.copyWith(isCleaning: false, error: e.toString()),
      );
    }
  }

  void reset() => state = MyClutterState(activeType: state.activeType);
}
