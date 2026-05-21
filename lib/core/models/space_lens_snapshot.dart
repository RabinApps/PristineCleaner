import 'file_item.dart';

class SpaceLensSnapshot {
  final String rootPath;
  final List<FileItem> topFolders;
  final Map<String, List<FileItem>> itemsByPath;

  const SpaceLensSnapshot({
    required this.rootPath,
    required this.topFolders,
    required this.itemsByPath,
  });

  List<FileItem> childrenFor(String path) {
    return itemsByPath[path] ?? const <FileItem>[];
  }
}
