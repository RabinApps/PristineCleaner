import 'dart:io';
import 'dart:isolate';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/file_item.dart';

final trashServiceProvider = Provider<TrashService>((ref) => TrashService());

class TrashService {
  Future<bool> moveToTrash(String path) async {
    return Isolate.run<bool>(() => _moveToTrashPath(path));
  }

  Future<List<String>> deleteItems(
    List<FileItem> items, {
    bool permanent = false,
  }) async {
    final payloadItems = items.map(_fileItemToPayload).toList(growable: false);
    final errors = await Isolate.run<List<String>>(
      () => _deleteItemsPayload(payloadItems, permanent: permanent),
    );
    return errors;
  }
}

Future<List<String>> _deleteItemsPayload(
  List<Map<String, dynamic>> items, {
  required bool permanent,
}) async {
  final errors = <String>[];
  for (final payload in items) {
    final item = _fileItemFromPayload(payload);
    try {
      if (permanent) {
        await _permanentDeleteItem(item);
      } else {
        final ok = await _moveToTrashPath(item.path);
        if (!ok) await _permanentDeleteItem(item);
      }
    } catch (e) {
      errors.add('${item.name}: $e');
    }
  }
  return errors;
}

Future<bool> _moveToTrashPath(String path) async {
  try {
    if (Platform.isMacOS) {
      final escaped = path.replaceAll('"', '\\"');
      final result = await Process.run('osascript', [
        '-e',
        'tell application "Finder" to delete POSIX file "$escaped"',
      ]);
      return result.exitCode == 0;
    } else if (Platform.isLinux) {
      var result = await Process.run('gio', ['trash', path]);
      if (result.exitCode == 0) return true;
      result = await Process.run('gvfs-trash', [path]);
      return result.exitCode == 0;
    } else if (Platform.isWindows) {
      final escaped = path.replaceAll("'", "''");
      final result = await Process.run('powershell', [
        '-NoProfile',
        '-Command',
        "Add-Type -AssemblyName Microsoft.VisualBasic; "
            "[Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile('$escaped',"
            " 'OnlyErrorDialogs', 'SendToRecycleBin')",
      ]);
      return result.exitCode == 0;
    }
  } catch (_) {}
  return false;
}

Future<void> _permanentDeleteItem(FileItem item) async {
  if (item.isDirectory) {
    await Directory(item.path).delete(recursive: true);
  } else {
    await File(item.path).delete();
  }
}

Map<String, dynamic> _fileItemToPayload(FileItem item) => {
  'path': item.path,
  'name': item.name,
  'sizeBytes': item.sizeBytes,
  'modifiedMs': item.modified.millisecondsSinceEpoch,
  'isDirectory': item.isDirectory,
  'isSelected': item.isSelected,
};

FileItem _fileItemFromPayload(Map<String, dynamic> payload) {
  return FileItem(
    path: payload['path'] as String,
    name: payload['name'] as String,
    sizeBytes: payload['sizeBytes'] as int,
    modified: DateTime.fromMillisecondsSinceEpoch(payload['modifiedMs'] as int),
    isDirectory: payload['isDirectory'] as bool,
    isSelected: payload['isSelected'] as bool,
  );
}
