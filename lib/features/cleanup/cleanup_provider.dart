import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    state = const ScanViewModel(isScanning: true);
    try {
      final result = await ref.read(fileServiceProvider).scanCleanup();
      state = ScanViewModel(result: result);
    } catch (e) {
      state = ScanViewModel(error: e.toString());
    }
  }

  void toggleItem(int index) {
    state = state.withToggled(index);
  }

  void selectAll() => state = state.withAllSelected(true);
  void deselectAll() => state = state.withAllSelected(false);

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
