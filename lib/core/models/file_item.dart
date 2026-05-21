import '../utils/format_utils.dart';

class FileItem {
  final String path;
  final String name;
  final int sizeBytes;
  final DateTime modified;
  final bool isDirectory;
  final bool isSelected;

  const FileItem({
    required this.path,
    required this.name,
    required this.sizeBytes,
    required this.modified,
    required this.isDirectory,
    this.isSelected = false,
  });

  String get formattedSize => formatBytes(sizeBytes);

  FileItem copyWith({
    String? path,
    String? name,
    int? sizeBytes,
    DateTime? modified,
    bool? isDirectory,
    bool? isSelected,
  }) {
    return FileItem(
      path: path ?? this.path,
      name: name ?? this.name,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      modified: modified ?? this.modified,
      isDirectory: isDirectory ?? this.isDirectory,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
