import '../../core/models/file_item.dart';
import '../../core/models/scan_result.dart';

/// Shared view-model for sections that follow the scan → review → clean workflow.
class ScanViewModel {
  final bool isScanning;
  final ScanResult? result;
  final bool isCleaning;
  final bool isDone;
  final String? error;

  const ScanViewModel({
    this.isScanning = false,
    this.result,
    this.isCleaning = false,
    this.isDone = false,
    this.error,
  });

  bool get hasResults => result != null && !isScanning;
  bool get isIdle => !isScanning && !isCleaning && result == null && !isDone;

  ScanViewModel copyWith({
    bool? isScanning,
    ScanResult? result,
    bool? isCleaning,
    bool? isDone,
    String? error,
    bool clearResult = false,
    bool clearError = false,
  }) {
    return ScanViewModel(
      isScanning: isScanning ?? this.isScanning,
      result: clearResult ? null : (result ?? this.result),
      isCleaning: isCleaning ?? this.isCleaning,
      isDone: isDone ?? this.isDone,
      error: clearError ? null : (error ?? this.error),
    );
  }

  /// Returns a new [ScanViewModel] with the item at [index] toggled.
  ScanViewModel withToggled(int index) {
    final r = result;
    if (r == null) return this;
    final items = List<FileItem>.from(r.items);
    items[index] = items[index].copyWith(isSelected: !items[index].isSelected);
    return copyWith(result: r.withUpdatedItems(items));
  }

  /// Returns a new [ScanViewModel] with all items selected or deselected.
  ScanViewModel withAllSelected(bool selected) {
    final r = result;
    if (r == null) return this;
    final items = r.items.map((i) => i.copyWith(isSelected: selected)).toList();
    return copyWith(result: r.withUpdatedItems(items));
  }
}
