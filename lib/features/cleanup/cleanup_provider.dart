import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/scan_result.dart';
import '../../core/services/file_service.dart';
import '../../core/services/trash_service.dart';
import '../shared/scan_view_model.dart';

final cleanupProvider = NotifierProvider<CleanupNotifier, ScanViewModel>(
  CleanupNotifier.new,
);

class CleanupNotifier extends Notifier<ScanViewModel> {
  @override
  ScanViewModel build() => const ScanViewModel();

  Future<void> scan() async {
    state = const ScanViewModel(
      isScanning: true,
      progressPercent: 0,
      progressLabel: 'Counting files...',
    );
    try {
      final result = await ref
          .read(fileServiceProvider)
          .scanCleanup(onProgress: _onProgress);
      state = ScanViewModel(result: result);
    } on ScanCancelledException {
      state = const ScanViewModel();
    } catch (e) {
      state = ScanViewModel(error: e.toString());
    }
  }

  void _onProgress(ScanProgress progress) {
    final label = progress.phase == ScanPhase.counting
        ? 'Counting files...'
        : progress.percentLabel;
    state = state.copyWith(
      isScanning: true,
      progressPercent: progress.percent,
      progressLabel: label,
      clearError: true,
    );
  }

  void toggleItem(int index) {
    state = state.withToggled(index);
  }

  /// Toggle all items whose [category] and [group] match [groupKey].
  void toggleGroup(String category, String groupKey, bool selected) {
    final r = state.result;
    if (r == null) return;
    final items = r.items.map((item) {
      if (item.category == category && item.group == groupKey) {
        return item.copyWith(isSelected: selected);
      }
      return item;
    }).toList();
    state = state.copyWith(result: r.withUpdatedItems(items));
  }

  /// Toggle all items in a specific category.
  void toggleCategory(String category, bool selected) {
    final r = state.result;
    if (r == null) return;
    final items = r.items.map((item) {
      if (item.category == category) {
        return item.copyWith(isSelected: selected);
      }
      return item;
    }).toList();
    state = state.copyWith(result: r.withUpdatedItems(items));
  }

  void selectAll() => state = state.withAllSelected(true);
  void deselectAll() => state = state.withAllSelected(false);

  void stop() => ref.read(fileServiceProvider).cancelActiveScan();

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
