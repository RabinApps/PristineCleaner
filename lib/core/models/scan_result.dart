import '../utils/format_utils.dart';
import 'file_item.dart';

class ScanResult {
  final List<FileItem> items;
  final int totalBytes;
  final Duration scanDuration;

  const ScanResult({
    required this.items,
    required this.totalBytes,
    required this.scanDuration,
  });

  List<FileItem> get selectedItems => items.where((i) => i.isSelected).toList();

  int get selectedBytes => selectedItems.fold(0, (sum, i) => sum + i.sizeBytes);

  String get formattedTotal => formatBytes(totalBytes);
  String get formattedSelected => formatBytes(selectedBytes);

  ScanResult withUpdatedItems(List<FileItem> newItems) {
    return ScanResult(
      items: newItems,
      totalBytes: totalBytes,
      scanDuration: scanDuration,
    );
  }
}

class DiskInfo {
  final String mountPoint;
  final int totalBytes;
  final int usedBytes;
  final int freeBytes;

  const DiskInfo({
    required this.mountPoint,
    required this.totalBytes,
    required this.usedBytes,
    required this.freeBytes,
  });

  double get usedPercent =>
      totalBytes > 0 ? (usedBytes / totalBytes).clamp(0.0, 1.0) : 0.0;

  String get formattedTotal => formatBytes(totalBytes);
  String get formattedUsed => formatBytes(usedBytes);
  String get formattedFree => formatBytes(freeBytes);
}
