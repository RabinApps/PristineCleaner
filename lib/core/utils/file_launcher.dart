import 'dart:io';

import 'package:flutter/foundation.dart';

/// Opens a file or folder in the system file manager
/// - macOS: Uses `open` command
/// - Linux: Uses `xdg-open` command
/// - Windows: Uses `start` command (explorer)
Future<void> openFileOrFolder(String path) async {
  try {
    String command;
    List<String> args;

    if (Platform.isMacOS) {
      command = 'open';
      args = [path];
    } else if (Platform.isLinux) {
      command = 'xdg-open';
      args = [path];
    } else if (Platform.isWindows) {
      command = 'explorer';
      args = [path];
    } else {
      throw UnsupportedError('Platform not supported');
    }

    await Process.run(command, args);
  } catch (e) {
    debugPrint('Error opening file/folder: $e');
    rethrow;
  }
}

/// Reveals a file or folder in the system file manager, selecting it
/// - macOS: Uses `open -R` command
/// - Linux: Falls back to opening the parent directory
/// - Windows: Uses `explorer /select` command
Future<void> revealFileOrFolder(String path) async {
  try {
    if (Platform.isMacOS) {
      await Process.run('open', ['-R', path]);
    } else if (Platform.isLinux) {
      // Linux doesn't have a built-in reveal, so open parent directory
      final parentPath = path.substring(0, path.lastIndexOf('/'));
      await openFileOrFolder(parentPath);
    } else if (Platform.isWindows) {
      await Process.run('explorer', ['/select,', path]);
    } else {
      throw UnsupportedError('Platform not supported');
    }
  } catch (e) {
    debugPrint('Error revealing file/folder: $e');
    rethrow;
  }
}
