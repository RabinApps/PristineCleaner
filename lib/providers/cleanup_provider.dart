import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../gen/strings.g.dart';
import '../core/models/removal_models.dart';
import '../core/models/scan_result.dart';
import '../services/file_service.dart';
import '../services/trash_service.dart';
import '../core/models/scan_view_model.dart';

final cleanupProvider = NotifierProvider<CleanupNotifier, ScanViewModel>(
  CleanupNotifier.new,
);

class CleanupNotifier extends Notifier<ScanViewModel> {
  @override
  ScanViewModel build() => const ScanViewModel();

  Future<void> scan() async {
    state = ScanViewModel(
      isScanning: true,
      progressPercent: 0,
      progressLabel: t.progress.countingFiles,
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
        ? t.progress.countingFiles
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
      final errors = await ref.read(trashServiceProvider).deleteItems(selected);
      if (errors.isEmpty) {
        state = const ScanViewModel(isDone: true);
      } else {
        // Some items could not be removed (e.g. move-to-Trash failed). Keep the
        // results visible and surface the failure instead of reporting a clean
        // sweep that did not happen.
        state = state.copyWith(
          isCleaning: false,
          error: t.errors.itemsFailedToRemove.replaceAll(
            '{count}',
            '${errors.length}',
          ),
        );
      }
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

    final updated = ScanResult(
      items: remaining,
      totalBytes: totalBytes,
      scanDuration: current.scanDuration,
    );

    state = state.copyWith(
      result: updated,
      isCleaning: false,
      error: outcome.errors.isEmpty
          ? null
          : t.errors.itemsFailedToRemove.replaceAll(
              '{count}',
              '${outcome.errors.length}',
            ),
      clearError: outcome.errors.isEmpty,
    );
  }

  void reset() => state = const ScanViewModel();
}
