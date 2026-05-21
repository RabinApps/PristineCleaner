import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/file_item.dart';
import '../models/scan_result.dart';

final myToolsServiceProvider = Provider<MyToolsService>((ref) {
  return MyToolsService();
});

class MyToolsService {
  Future<ScanResult> scanTrashBins() async {
    if (Platform.isMacOS) {
      return _scanMacTrashWithFinder();
    }

    final roots = <String>[];
    final home = _homePath;

    if (Platform.isLinux) {
      roots.add('$home/.local/share/Trash/files');
    } else if (Platform.isWindows) {
      roots.add('$home\\.Trash');
      roots.add('$home\\AppData\\Local\\Temp');
    }

    return _scanTopLevelRoots(roots, maxItems: 500);
  }

  Future<ScanResult> _scanMacTrashWithFinder() async {
    final sw = Stopwatch()..start();
    final items = <FileItem>[];

    try {
      final result = await Process.run('osascript', [
        '-e',
        'tell application "Finder"',
        '-e',
        'set outputLines to {}',
        '-e',
        'repeat with aFile in (get items of trash)',
        '-e',
        'set n to (name of aFile as text)',
        '-e',
        'set p to (POSIX path of (aFile as alias))',
        '-e',
        'set s to (physical size of aFile as text)',
        '-e',
        'set isFolderItem to ((class of aFile is folder) as text)',
        '-e',
        'copy (n & "||" & p & "||" & s & "||" & isFolderItem) to end of outputLines',
        '-e',
        'end repeat',
        '-e',
        'set AppleScript\'s text item delimiters to linefeed',
        '-e',
        'return outputLines as text',
        '-e',
        'end tell',
      ]);

      if (result.exitCode == 0) {
        final lines = (result.stdout as String)
            .split('\n')
            .map((line) => line.trim())
            .where((line) => line.isNotEmpty)
            .toList(growable: false);

        for (final line in lines) {
          final parts = line.split('||');
          if (parts.length != 4) continue;

          final name = parts[0].trim();
          final path = parts[1].trim();
          final size = int.tryParse(parts[2].trim()) ?? 0;
          final isDirectory = parts[3].trim().toLowerCase() == 'true';
          if (path.isEmpty) continue;

          items.add(
            FileItem(
              path: path,
              name: name.isEmpty ? _basename(path) : name,
              sizeBytes: size,
              modified: DateTime.now(),
              isDirectory: isDirectory,
              isSelected: true,
            ),
          );
        }
      }
    } catch (_) {}

    items.sort((a, b) => b.sizeBytes.compareTo(a.sizeBytes));
    final totalBytes = items.fold<int>(0, (sum, item) => sum + item.sizeBytes);
    sw.stop();
    return ScanResult(
      items: items,
      totalBytes: totalBytes,
      scanDuration: sw.elapsed,
    );
  }

  Future<ScanResult> scanApplicationPermissions() async {
    final home = _homePath;
    final roots = <String>[];

    if (Platform.isMacOS) {
      roots.addAll([
        '$home/Library/Application Support/com.apple.TCC',
        '$home/Library/Preferences/com.apple.TCC.plist',
        '/Library/Application Support/com.apple.TCC',
      ]);
    } else if (Platform.isLinux) {
      roots.addAll(['$home/.config', '$home/.local/share']);
    } else if (Platform.isWindows) {
      roots.addAll(['$home\\AppData\\Roaming', '$home\\AppData\\Local']);
    }

    return _scanFileRoots(
      roots,
      recursive: true,
      includeFile: (file, _) {
        final name = file.path.toLowerCase();
        return name.contains('tcc') ||
            name.contains('permission') ||
            name.endsWith('.db') ||
            name.endsWith('.plist');
      },
      maxItems: 300,
    );
  }

  Future<ScanResult> scanMailAttachments() async {
    final home = _homePath;
    final roots = <String>[];

    if (Platform.isMacOS) {
      roots.addAll([
        '$home/Library/Containers/com.apple.mail/Data/Library/Mail Downloads',
        '$home/Library/Mail',
      ]);
    } else if (Platform.isLinux) {
      roots.add('$home/.local/share');
    } else if (Platform.isWindows) {
      roots.add('$home\\AppData\\Local\\Packages');
    }

    return _scanFileRoots(
      roots,
      recursive: true,
      includeFile: (file, _) {
        final lower = file.path.toLowerCase();
        if (Platform.isMacOS) {
          return lower.contains('/mail downloads/') ||
              lower.contains('/library/mail/') ||
              lower.endsWith('.emlx') ||
              lower.endsWith('.eml') ||
              lower.endsWith('.pdf') ||
              lower.endsWith('.zip');
        }
        return lower.endsWith('.eml') ||
            lower.endsWith('.pdf') ||
            lower.endsWith('.zip');
      },
      maxItems: 500,
    );
  }

  Future<ScanResult> scanMalwareCandidates() async {
    final home = _homePath;
    final roots = <String>[];
    if (Platform.isWindows) {
      roots.add('$home\\Downloads');
      roots.add('$home\\Desktop');
    } else {
      roots.add('$home/Downloads');
      roots.add('$home/Desktop');
    }

    const suspiciousExt = {
      '.dmg',
      '.pkg',
      '.command',
      '.sh',
      '.js',
      '.jar',
      '.exe',
      '.msi',
      '.scr',
      '.bat',
      '.app',
    };

    return _scanFileRoots(
      roots,
      recursive: true,
      includeFile: (file, stat) {
        final lower = file.path.toLowerCase();
        final hasSuspiciousExt = suspiciousExt.any(lower.endsWith);
        final executable = !Platform.isWindows && (stat.mode & 0x49) != 0;
        return hasSuspiciousExt || executable;
      },
      maxItems: 400,
    );
  }

  Future<ScanResult> scanMaintenanceTasks() async {
    final home = _homePath;
    final roots = <String>[];

    if (Platform.isMacOS) {
      roots.addAll([
        '$home/Library/Caches',
        '$home/Library/Logs',
        '/Library/Logs',
      ]);
    } else if (Platform.isLinux) {
      roots.addAll(['$home/.cache', '/tmp']);
    } else if (Platform.isWindows) {
      roots.addAll(['$home\\AppData\\Local\\Temp']);
    }

    final cutoff = DateTime.now().subtract(const Duration(days: 30));
    return _scanFileRoots(
      roots,
      recursive: true,
      includeFile: (_, stat) => stat.modified.isBefore(cutoff),
      maxItems: 600,
    );
  }

  Future<ScanResult> scanTimeMachineSnapshots() async {
    if (!Platform.isMacOS) {
      return const ScanResult(
        items: [],
        totalBytes: 0,
        scanDuration: Duration.zero,
      );
    }

    final sw = Stopwatch()..start();
    final items = <FileItem>[];

    try {
      final result = await Process.run('tmutil', ['listlocalsnapshots', '/']);
      if (result.exitCode == 0) {
        final output = (result.stdout as String)
            .split('\n')
            .map((line) => line.trim())
            .where((line) => line.isNotEmpty)
            .toList(growable: false);

        for (final line in output) {
          final id = _extractSnapshotId(line);
          if (id == null) continue;
          items.add(
            FileItem(
              path: id,
              name: 'Snapshot $id',
              sizeBytes: 0,
              modified: DateTime.now(),
              isDirectory: false,
              isSelected: true,
              group: 'Time Machine',
            ),
          );
        }
      }
    } catch (_) {}

    sw.stop();
    return ScanResult(items: items, totalBytes: 0, scanDuration: sw.elapsed);
  }

  Future<List<String>> deleteTimeMachineSnapshots(
    List<String> snapshotIds,
  ) async {
    final errors = <String>[];
    if (!Platform.isMacOS) {
      errors.add('Time Machine snapshots are only available on macOS.');
      return errors;
    }

    for (final id in snapshotIds) {
      try {
        final result = await Process.run('tmutil', [
          'deletelocalsnapshots',
          id,
        ]);
        if (result.exitCode != 0) {
          final stderr = (result.stderr as String?)?.trim();
          errors.add(stderr == null || stderr.isEmpty ? id : '$id: $stderr');
        }
      } catch (e) {
        errors.add('$id: $e');
      }
    }
    return errors;
  }

  Future<ScanResult> _scanFileRoots(
    List<String> roots, {
    required bool recursive,
    bool Function(File file, FileStat stat)? includeFile,
    int maxItems = 1000,
  }) async {
    final sw = Stopwatch()..start();
    final items = <FileItem>[];

    for (final root in roots) {
      if (items.length >= maxItems) break;
      final normalized = root.trim();
      if (normalized.isEmpty) continue;

      final entityType = FileSystemEntity.typeSync(normalized);
      if (entityType == FileSystemEntityType.notFound) {
        continue;
      }

      if (entityType == FileSystemEntityType.file) {
        final file = File(normalized);
        try {
          final stat = await file.stat();
          if (includeFile?.call(file, stat) ?? true) {
            items.add(
              FileItem(
                path: file.path,
                name: _basename(file.path),
                sizeBytes: stat.size,
                modified: stat.modified,
                isDirectory: false,
                isSelected: true,
              ),
            );
          }
        } catch (_) {}
        continue;
      }

      final dir = Directory(normalized);
      try {
        await for (final entity in dir.list(
          recursive: recursive,
          followLinks: false,
        )) {
          if (items.length >= maxItems) break;
          if (entity is! File) continue;
          try {
            final stat = await entity.stat();
            if (!(includeFile?.call(entity, stat) ?? true)) {
              continue;
            }
            items.add(
              FileItem(
                path: entity.path,
                name: _basename(entity.path),
                sizeBytes: stat.size,
                modified: stat.modified,
                isDirectory: false,
                isSelected: true,
              ),
            );
          } catch (_) {}
        }
      } catch (_) {}
    }

    items.sort((a, b) => b.sizeBytes.compareTo(a.sizeBytes));
    final totalBytes = items.fold<int>(0, (sum, item) => sum + item.sizeBytes);
    sw.stop();
    return ScanResult(
      items: items,
      totalBytes: totalBytes,
      scanDuration: sw.elapsed,
    );
  }

  Future<ScanResult> _scanTopLevelRoots(
    List<String> roots, {
    int maxItems = 500,
  }) async {
    final sw = Stopwatch()..start();
    final items = <FileItem>[];

    for (final root in roots) {
      if (items.length >= maxItems) break;
      final normalized = root.trim();
      if (normalized.isEmpty) continue;

      final type = FileSystemEntity.typeSync(normalized);
      if (type != FileSystemEntityType.directory) {
        continue;
      }

      final dir = Directory(normalized);
      try {
        await for (final entry in dir.list(
          recursive: false,
          followLinks: false,
        )) {
          if (items.length >= maxItems) break;
          try {
            final stat = await entry.stat();
            final isDir = entry is Directory;
            final size = isDir ? await _dirSize(entry.path) : stat.size;

            items.add(
              FileItem(
                path: entry.path,
                name: _basename(entry.path),
                sizeBytes: size,
                modified: stat.modified,
                isDirectory: isDir,
                isSelected: true,
              ),
            );
          } catch (_) {}
        }
      } catch (_) {}
    }

    items.sort((a, b) => b.sizeBytes.compareTo(a.sizeBytes));
    final totalBytes = items.fold<int>(0, (sum, item) => sum + item.sizeBytes);
    sw.stop();
    return ScanResult(
      items: items,
      totalBytes: totalBytes,
      scanDuration: sw.elapsed,
    );
  }

  Future<int> _dirSize(String path) async {
    var total = 0;
    try {
      await for (final entity in Directory(
        path,
      ).list(recursive: true, followLinks: false)) {
        if (entity is File) {
          try {
            total += await entity.length();
          } catch (_) {}
        }
      }
    } catch (_) {}
    return total;
  }

  String get _homePath {
    if (Platform.isWindows) {
      final userProfile = Platform.environment['USERPROFILE'];
      if (userProfile != null && userProfile.isNotEmpty) {
        return userProfile;
      }
    }
    final home = Platform.environment['HOME'];
    if (home != null && home.isNotEmpty) {
      return home;
    }
    return Directory.current.path;
  }

  String? _extractSnapshotId(String line) {
    if (line.contains('com.apple.TimeMachine.')) {
      return line.split('com.apple.TimeMachine.').last.trim();
    }
    if (RegExp(r'^\d{4}-\d{2}-\d{2}-\d{6}$').hasMatch(line)) {
      return line;
    }
    return null;
  }

  String _basename(String path) {
    final sep = Platform.pathSeparator;
    final normalized = path.endsWith(sep)
        ? path.substring(0, path.length - 1)
        : path;
    final idx = normalized.lastIndexOf(sep);
    return idx == -1 ? normalized : normalized.substring(idx + 1);
  }
}
