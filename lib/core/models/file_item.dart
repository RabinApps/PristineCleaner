import '../utils/format_utils.dart';

class FileItem {
  final String path;
  final String name;
  final int sizeBytes;
  final DateTime modified;
  final String? iconPath;
  final DateTime? lastUsed;
  final bool isDirectory;
  final bool isSelected;
  /// Cleanup category id, e.g. 'user_cache', 'user_logs', 'system_logs'.
  final String? category;
  /// Display name of the immediate parent group within the scan root.
  final String? group;

  const FileItem({
    required this.path,
    required this.name,
    required this.sizeBytes,
    required this.modified,
    this.iconPath,
    this.lastUsed,
    required this.isDirectory,
    this.isSelected = false,
    this.category,
    this.group,
  });

  String get formattedSize => formatBytes(sizeBytes);

  FileItem copyWith({
    String? path,
    String? name,
    int? sizeBytes,
    DateTime? modified,
    String? iconPath,
    DateTime? lastUsed,
    bool? isDirectory,
    bool? isSelected,
    String? category,
    String? group,
  }) {
    return FileItem(
      path: path ?? this.path,
      name: name ?? this.name,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      modified: modified ?? this.modified,
      iconPath: iconPath ?? this.iconPath,
      lastUsed: lastUsed ?? this.lastUsed,
      isDirectory: isDirectory ?? this.isDirectory,
      isSelected: isSelected ?? this.isSelected,
      category: category ?? this.category,
      group: group ?? this.group,
    );
  }
}
