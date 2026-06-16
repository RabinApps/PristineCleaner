import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import '../core/models/file_item.dart';
import '../core/models/removal_models.dart';
import '../core/models/scan_result.dart';
import '../gen/strings.g.dart';
import 'scan_manager.dart';

final myToolsServiceProvider = Provider<MyToolsService>((ref) {
  return MyToolsService();
});

class MyToolsService {
  int _nextScanId = 0;

  String _nextId() => 'mytools_${_nextScanId++}';

  Future<ScanResult> scanTrashBins() async {
    final id = _nextId();
    try {
      ScanManager.instance.registerScan(id);
      if (Platform.isMacOS) {
        return await _scanMacTrashWithFinder();
      }

      final roots = <String>[];
      final home = _homePath;

      if (Platform.isLinux) {
        roots.add('$home/.local/share/Trash/files');
      } else if (Platform.isWindows) {
        roots.add('$home\\.Trash');
        roots.add('$home\\AppData\\Local\\Temp');
      }

      return await _scanTopLevelRoots(roots, maxItems: 500);
    } finally {
      ScanManager.instance.unregisterScan(id);
    }
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
    final id = _nextId();
    try {
      ScanManager.instance.registerScan(id);
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

      return await _scanFileRoots(
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
    } finally {
      ScanManager.instance.unregisterScan(id);
    }
  }

  Future<ScanResult> scanBackgroundItems() async {
    final id = _nextId();
    try {
      ScanManager.instance.registerScan(id);
      final home = _homePath;
      final roots = <String>[];

      if (Platform.isMacOS) {
        roots.addAll([
          '$home/Library/LaunchAgents',
          '/Library/LaunchAgents',
          '/Library/LaunchDaemons',
          '/System/Library/LaunchAgents',
          '/System/Library/LaunchDaemons',
        ]);
      } else if (Platform.isLinux) {
        roots.addAll([
          '$home/.config/autostart',
          '/etc/xdg/autostart',
          '$home/.config/systemd/user',
          '/etc/systemd/user',
          '/usr/lib/systemd/user',
        ]);
      } else if (Platform.isWindows) {
        final appData = Platform.environment['APPDATA'] ?? '';
        final programData =
            Platform.environment['ProgramData'] ?? r'C:\\ProgramData';
        roots.addAll([
          '$appData\\Microsoft\\Windows\\Start Menu\\Programs\\Startup',
          '$programData\\Microsoft\\Windows\\Start Menu\\Programs\\Startup',
        ]);
      }

      return await _scanFileRoots(
        roots,
        recursive: false,
        includeFile: (file, _) {
          final path = file.path.toLowerCase();
          if (Platform.isMacOS) {
            return path.endsWith('.plist');
          }
          if (Platform.isLinux) {
            return path.endsWith('.desktop') ||
                path.endsWith('.service') ||
                path.endsWith('.timer') ||
                path.endsWith('.socket');
          }
          return true;
        },
        maxItems: 500,
      );
    } finally {
      ScanManager.instance.unregisterScan(id);
    }
  }

  List<String> _getMailAttachmentRoots() {
    final home = _homePath;

    List<String> roots = [];

    if (Platform.isMacOS) {
      roots.addAll([
        // Where Apple Mail extracts attachments when a user double-clicks/previews them
        p.join(
          home,
          'Library',
          'Containers',
          'com.apple.mail',
          'Data',
          'Library',
          'Mail Downloads',
        ),
        // Raw local mailboxes (Note: Files here are raw .eml/.mbox structures)
        p.join(home, 'Library', 'Mail'),
      ]);
    } else if (Platform.isLinux) {
      roots.addAll([
        // Standard Thunderbird profile directory
        p.join(home, '.thunderbird'),
        // Flatpak version of Thunderbird
        p.join(home, '.var', 'app', 'org.mozilla.Thunderbird', '.thunderbird'),
        // Evolution Mail local directory
        p.join(home, '.local', 'share', 'evolution', 'mail', 'local'),
      ]);
    } else if (Platform.isWindows) {
      roots.addAll([
        // Windows Mail & Calendar built-in App cache
        p.join(
          home,
          'AppData',
          'Local',
          'Packages',
          'microsoft.windowscommunicationsapps_8wekyb3d8bbwe',
          'LocalState',
          'Files',
        ),
        // Classic Microsoft Outlook Secure Temp folder (where opened attachments live)
        p.join(
          home,
          'AppData',
          'Local',
          'Microsoft',
          'Windows',
          'INetCache',
          'Content.Outlook',
        ),
        // Thunderbird Windows Profiles
        p.join(home, 'AppData', 'Roaming', 'Thunderbird', 'Profiles'),
      ]);
    }

    // Filter out paths that don't exist on the machine to prevent directory listing crashes
    List<String> validRoots = [];
    for (String path in roots) {
      if (Directory(path).existsSync()) {
        validRoots.add(path);
      }
    }

    return validRoots;
  }

  Future<ScanResult> scanMailAttachments() async {
    final id = _nextId();
    try {
      ScanManager.instance.registerScan(id);
      final roots = _getMailAttachmentRoots();

      return await _scanFileRoots(
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
    } finally {
      ScanManager.instance.unregisterScan(id);
    }
  }

  Future<ScanResult> scanMalwareCandidates() async {
    final id = _nextId();
    try {
      ScanManager.instance.registerScan(id);
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

      return await _scanFileRoots(
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
    } finally {
      ScanManager.instance.unregisterScan(id);
    }
  }

  Future<ScanResult> scanTimeMachineSnapshots() async {
    final id = _nextId();
    try {
      ScanManager.instance.registerScan(id);
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
                name: t.myToolsService.snapshotName.replaceAll('{id}', id),
                sizeBytes: 0,
                modified: DateTime.now(),
                isDirectory: false,
                isSelected: true,
                group: t.myToolsService.timeMachineGroup,
              ),
            );
          }
        }
      } catch (_) {}

      sw.stop();
      return ScanResult(items: items, totalBytes: 0, scanDuration: sw.elapsed);
    } finally {
      ScanManager.instance.unregisterScan(id);
    }
  }

  Future<List<String>> deleteTimeMachineSnapshots(
    List<String> snapshotIds,
  ) async {
    final snapshots = snapshotIds
        .map(
          (id) => FileItem(
            path: id,
            name: t.myToolsService.snapshotName.replaceAll('{id}', id),
            sizeBytes: 0,
            modified: DateTime.now(),
            isDirectory: false,
            isSelected: true,
          ),
        )
        .toList(growable: false);
    final outcome = await deleteTimeMachineSnapshotsTracked(snapshots);
    return outcome.errors;
  }

  Future<RemovalOutcome> deleteTimeMachineSnapshotsTracked(
    List<FileItem> snapshots, {
    RemovalCancellationToken? cancellationToken,
    void Function(RemovalProgress progress)? onProgress,
  }) async {
    final token = cancellationToken ?? RemovalCancellationToken();
    final errors = <String>[];
    final deleted = <FileItem>[];

    if (!Platform.isMacOS) {
      return RemovalOutcome(
        deletedItems: const <FileItem>[],
        deletedBytes: 0,
        errors: <String>[t.myToolsService.timeMachineMacOnly],
      );
    }

    onProgress?.call(
      RemovalProgress(
        processedItems: 0,
        totalItems: snapshots.length,
        deletedItems: 0,
        deletedBytes: 0,
        stopRequested: token.isStopRequested,
      ),
    );

    for (var i = 0; i < snapshots.length; i++) {
      if (token.isStopRequested) {
        break;
      }

      final snapshot = snapshots[i];
      final id = snapshot.path;
      try {
        final result = await Process.run('tmutil', [
          'deletelocalsnapshots',
          id,
        ]);
        if (result.exitCode != 0) {
          final stderr = (result.stderr as String?)?.trim();
          errors.add(stderr == null || stderr.isEmpty ? id : '$id: $stderr');
        } else {
          deleted.add(snapshot);
        }
      } catch (e) {
        errors.add('$id: $e');
      }

      onProgress?.call(
        RemovalProgress(
          processedItems: i + 1,
          totalItems: snapshots.length,
          deletedItems: deleted.length,
          deletedBytes: 0,
          currentItemName: snapshot.name,
          stopRequested: token.isStopRequested,
        ),
      );
    }

    return RemovalOutcome(
      deletedItems: deleted,
      deletedBytes: 0,
      errors: errors,
      stoppedByUser:
          token.isStopRequested &&
          deleted.length + errors.length < snapshots.length,
    );
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

  @visibleForTesting
  String? extractSnapshotId(String line) => _extractSnapshotId(line);

  @visibleForTesting
  String basename(String path) => _basename(path);

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
