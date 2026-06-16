import 'file_item.dart';
import 'scan_result.dart';

/// Shared view-model for sections that follow the scan → review → clean workflow.
class ScanViewModel {
  final bool isScanning;
  final ScanResult? result;
  final double? progressPercent;
  final String? progressLabel;
  final bool isCleaning;
  final bool isDone;
  final String? error;
  final String? selectedParentPath;
  final String? selectedParentName;
  final String? currentPath;
  final String? currentName;
  final List<String> breadcrumbs;

  const ScanViewModel({
    this.isScanning = false,
    this.result,
    this.progressPercent,
    this.progressLabel,
    this.isCleaning = false,
    this.isDone = false,
    this.error,
    this.selectedParentPath,
    this.selectedParentName,
    this.currentPath,
    this.currentName,
    this.breadcrumbs = const [],
  });

  bool get hasResults => result != null && !isScanning;
  bool get isIdle => !isScanning && !isCleaning && result == null && !isDone;

  ScanViewModel copyWith({
    bool? isScanning,
    ScanResult? result,
    double? progressPercent,
    String? progressLabel,
    bool? isCleaning,
    bool? isDone,
    String? error,
    String? selectedParentPath,
    String? selectedParentName,
    String? currentPath,
    String? currentName,
    List<String>? breadcrumbs,
    bool clearResult = false,
    bool clearProgress = false,
    bool clearError = false,
    bool clearCurrentPath = false,
    bool clearCurrentName = false,
    bool clearBreadcrumbs = false,
  }) {
    return ScanViewModel(
      isScanning: isScanning ?? this.isScanning,
      result: clearResult ? null : (result ?? this.result),
      progressPercent: clearProgress
          ? null
          : (progressPercent ?? this.progressPercent),
      progressLabel: clearProgress
          ? null
          : (progressLabel ?? this.progressLabel),
      isCleaning: isCleaning ?? this.isCleaning,
      isDone: isDone ?? this.isDone,
      error: clearError ? null : (error ?? this.error),
      selectedParentPath: selectedParentPath ?? this.selectedParentPath,
      selectedParentName: selectedParentName ?? this.selectedParentName,
      currentPath: clearCurrentPath ? null : (currentPath ?? this.currentPath),
      currentName: clearCurrentName ? null : (currentName ?? this.currentName),
      breadcrumbs: clearBreadcrumbs
          ? const []
          : (breadcrumbs ?? this.breadcrumbs),
    );
  }

  /// Returns a new [ScanViewModel] with the item at [index] toggled.
  ScanViewModel withToggled(int index) {
    final r = result;
    if (r == null) return this;
    if (index < 0 || index >= r.items.length) return this;
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
