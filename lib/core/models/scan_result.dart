import '../utils/format_utils.dart';
import 'file_item.dart';

enum ScanPhase { counting, scanning }

class ScanProgress {
  final ScanPhase phase;
  final int processed;
  final int total;
  final int processedBytes;

  const ScanProgress({
    required this.phase,
    required this.processed,
    required this.total,
    this.processedBytes = 0,
  });

  double get percent => total <= 0 ? 0 : (processed / total).clamp(0.0, 1.0);

  String get percentLabel => '${(percent * 100).toStringAsFixed(0)}%';
}

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

class SystemUsage {
  final double cpuPercent;
  final int totalMemoryBytes;
  final int usedMemoryBytes;
  final bool isAvailable;

  const SystemUsage({
    required this.cpuPercent,
    required this.totalMemoryBytes,
    required this.usedMemoryBytes,
    this.isAvailable = true,
  });

  const SystemUsage.unavailable()
    : cpuPercent = 0,
      totalMemoryBytes = 0,
      usedMemoryBytes = 0,
      isAvailable = false;

  double get cpuFraction => (cpuPercent / 100).clamp(0.0, 1.0);

  double get memoryUsedPercent => totalMemoryBytes > 0
      ? (usedMemoryBytes / totalMemoryBytes).clamp(0.0, 1.0)
      : 0.0;

  String get formattedUsedMemory => formatBytes(usedMemoryBytes);
  String get formattedTotalMemory => formatBytes(totalMemoryBytes);
}

class HomeDashboardData {
  final DiskInfo diskInfo;
  final SystemUsage systemUsage;
  final String? systemError;
  final DateTime updatedAt;

  const HomeDashboardData({
    required this.diskInfo,
    required this.systemUsage,
    required this.updatedAt,
    this.systemError,
  });
}
