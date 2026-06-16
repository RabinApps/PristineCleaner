import 'dart:io';
import 'dart:isolate';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/models/file_item.dart';
import '../core/models/removal_models.dart';

final trashServiceProvider = Provider<TrashService>((ref) => TrashService());

class TrashService {
  /// Moves [path] to the OS trash, returning whether it succeeded.
  ///
  /// Injectable so tests can exercise the failure path without driving the
  /// real OS trash.
  final Future<bool> Function(String path) _moveToTrash;

  TrashService({Future<bool> Function(String path)? moveToTrash})
    : _moveToTrash = moveToTrash ?? _moveToTrashPath;

  Future<bool> moveToTrash(String path) async {
    return Isolate.run<bool>(() => _moveToTrashPath(path));
  }

  Future<List<String>> deleteItems(
    List<FileItem> items, {
    bool permanent = false,
  }) async {
    final outcome = await deleteItemsTracked(items, permanent: permanent);
    return outcome.errors;
  }

  Future<RemovalOutcome> deleteItemsTracked(
    List<FileItem> items, {
    bool permanent = false,
    RemovalCancellationToken? cancellationToken,
    void Function(RemovalProgress progress)? onProgress,
  }) async {
    final token = cancellationToken ?? RemovalCancellationToken();
    final errors = <String>[];
    final deleted = <FileItem>[];
    var deletedBytes = 0;

    onProgress?.call(
      RemovalProgress(
        processedItems: 0,
        totalItems: items.length,
        deletedItems: 0,
        deletedBytes: 0,
        stopRequested: token.isStopRequested,
      ),
    );

    for (var i = 0; i < items.length; i++) {
      if (token.isStopRequested) {
        break;
      }

      final item = items[i];
      try {
        if (permanent) {
          await _permanentDeleteItem(item);
        } else {
          final ok = await _moveToTrash(item.path);
          if (!ok) {
            // Do NOT silently fall back to a permanent delete: the user asked
            // for a recoverable move-to-Trash, so a failure is reported as an
            // error and the file is left untouched.
            errors.add('${item.name}: could not move to Trash');
            onProgress?.call(
              RemovalProgress(
                processedItems: i + 1,
                totalItems: items.length,
                deletedItems: deleted.length,
                deletedBytes: deletedBytes,
                currentItemName: item.name,
                stopRequested: token.isStopRequested,
              ),
            );
            continue;
          }
        }

        deleted.add(item);
        deletedBytes += item.sizeBytes;
      } catch (e) {
        errors.add('${item.name}: $e');
      }

      onProgress?.call(
        RemovalProgress(
          processedItems: i + 1,
          totalItems: items.length,
          deletedItems: deleted.length,
          deletedBytes: deletedBytes,
          currentItemName: item.name,
          stopRequested: token.isStopRequested,
        ),
      );
    }

    return RemovalOutcome(
      deletedItems: deleted,
      deletedBytes: deletedBytes,
      errors: errors,
      stoppedByUser: token.isStopRequested && deleted.length < items.length,
    );
  }
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
