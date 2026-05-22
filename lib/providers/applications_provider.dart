import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../gen/strings.g.dart';
import '../core/models/removal_models.dart';
import '../core/models/scan_result.dart';
import '../services/file_service.dart';
import '../services/trash_service.dart';
import '../core/models/scan_view_model.dart';

final applicationsProvider =
    NotifierProvider<ApplicationsNotifier, ScanViewModel>(
      ApplicationsNotifier.new,
    );

class ApplicationsNotifier extends Notifier<ScanViewModel> {
  @override
  ScanViewModel build() => const ScanViewModel();

  Future<void> scan() async {
    state = ScanViewModel(
      isScanning: true,
      progressPercent: 0,
      progressLabel: t.progress.countingApplications,
    );
    try {
      final result = await ref
          .read(fileServiceProvider)
          .scanApplications(onProgress: _onProgress);
      state = ScanViewModel(result: result);
    } on ScanCancelledException {
      state = const ScanViewModel();
    } catch (e) {
      state = ScanViewModel(error: e.toString());
    }
  }

  void _onProgress(ScanProgress progress) {
    final label = progress.phase == ScanPhase.counting
        ? t.progress.countingApplications
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
          : t.errors.itemsFailedToRemove.replaceAll(
              '{count}',
              '${outcome.errors.length}',
            ),
      clearError: outcome.errors.isEmpty,
    );
  }

  void reset() => state = const ScanViewModel();
}
