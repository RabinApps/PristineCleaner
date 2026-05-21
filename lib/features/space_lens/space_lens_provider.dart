import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/file_item.dart';
import '../../core/models/scan_result.dart';
import '../../core/services/file_service.dart';
import '../../core/services/trash_service.dart';
import '../shared/scan_view_model.dart';

final spaceLensProvider = NotifierProvider<SpaceLensNotifier, ScanViewModel>(
  SpaceLensNotifier.new,
);

class SpaceLensNotifier extends Notifier<ScanViewModel> {
  @override
  ScanViewModel build() => const ScanViewModel();

  Future<void> scan() async {
    state = const ScanViewModel(
      isScanning: true,
      progressPercent: 0,
      progressLabel: 'Counting folders...',
    );
    try {
      final home =
          Platform.environment[Platform.isWindows ? 'USERPROFILE' : 'HOME'] ??
          '/';
      final folders = await ref
          .read(fileServiceProvider)
          .getTopFolders(home, limit: 30, onProgress: _onProgress);
      final totalBytes = folders.fold<int>(0, (s, f) => s + f.sizeBytes);
      final result = ScanResult(
        items: folders,
        totalBytes: totalBytes,
        scanDuration: Duration.zero,
      );
      state = ScanViewModel(result: result);
    } on ScanCancelledException {
      state = const ScanViewModel();
    } catch (e) {
      state = ScanViewModel(error: e.toString());
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

  Future<List<FileItem>> listDirectoryContents(String path) {
    return ref.read(fileServiceProvider).listDirectoryContents(path);
  }

  Future<void> clean() async {
    final selected = state.result?.selectedItems ?? [];
    if (selected.isEmpty) return;
    state = state.copyWith(isCleaning: true, clearError: true);
    try {
      await ref.read(trashServiceProvider).deleteItems(selected);
      state = const ScanViewModel(isDone: true);
    } catch (e) {
      state = state.copyWith(isCleaning: false, error: e.toString());
    }
  }

  void reset() => state = const ScanViewModel();
}
