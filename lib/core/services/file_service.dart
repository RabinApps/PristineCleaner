import 'dart:io';
import 'dart:isolate';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/file_item.dart';
import '../models/scan_result.dart';

final fileServiceProvider = Provider<FileService>((ref) => FileService());

class FileService {
  // ─── Disk Info ────────────────────────────────────────────────────────────

  Future<DiskInfo> getDiskInfo() async {
    try {
      if (Platform.isMacOS || Platform.isLinux) {
        final home = Platform.environment['HOME'] ?? '/';
        final result = await Process.run('df', ['-k', home]);
        if (result.exitCode == 0) {
          final lines = (result.stdout as String).trim().split('\n');
          if (lines.length >= 2) {
            final parts = lines[1].trim().split(RegExp(r'\s+'));
            if (parts.length >= 4) {
              final total = (int.tryParse(parts[1]) ?? 0) * 1024;
              final used = (int.tryParse(parts[2]) ?? 0) * 1024;
              final free = (int.tryParse(parts[3]) ?? 0) * 1024;
              return DiskInfo(
                mountPoint: parts.last,
                totalBytes: total,
                usedBytes: used,
                freeBytes: free,
              );
            }
          }
        }
      } else if (Platform.isWindows) {
        final result = await Process.run('wmic', [
          'logicaldisk',
          'where',
          'DeviceID="C:"',
          'get',
          'Size,FreeSpace',
          '/format:csv',
        ]);
        if (result.exitCode == 0) {
          final lines = (result.stdout as String)
              .trim()
              .split('\n')
              .where((l) => l.trim().isNotEmpty)
              .toList();
          if (lines.length >= 2) {
            final parts = lines.last.trim().split(',');
            if (parts.length >= 3) {
              final free = int.tryParse(parts[1].trim()) ?? 0;
              final total = int.tryParse(parts[2].trim()) ?? 0;
              return DiskInfo(
                mountPoint: 'C:',
                totalBytes: total,
                usedBytes: total - free,
                freeBytes: free,
              );
            }
          }
        }
      }
    } catch (_) {}
    return const DiskInfo(
      mountPoint: '/',
      totalBytes: 0,
      usedBytes: 0,
      freeBytes: 0,
    );
  }

  // ─── Cleanup (cache / temp) ───────────────────────────────────────────────

  Future<ScanResult> scanCleanup() async {
    final payload = await Isolate.run<Map<String, dynamic>>(
      () => _scanCleanupPayload(_cleanupDirs()),
    );
    return _scanResultFromPayload(payload);
  }

  List<String> _cleanupDirs() {
    final home = _home;
    if (Platform.isMacOS) {
      return ['$home/Library/Caches', '$home/Library/Logs', '/Library/Logs'];
    } else if (Platform.isLinux) {
      return ['$home/.cache', '/tmp'];
    } else if (Platform.isWindows) {
      final tmp = Platform.environment['TEMP'] ?? '';
      final local = Platform.environment['LOCALAPPDATA'] ?? '';
      return [tmp, '$local\\Temp'];
    }
    return [];
  }

  // ─── Large Files ──────────────────────────────────────────────────────────

  Future<ScanResult> scanLargeFiles(
    String rootPath, {
    int minSizeBytes = 50 * 1024 * 1024,
  }) async {
    final payload = await Isolate.run<Map<String, dynamic>>(
      () => _scanLargeFilesPayload(rootPath, minSizeBytes),
    );
    return _scanResultFromPayload(payload);
  }

  // ─── Downloads ────────────────────────────────────────────────────────────

  Future<ScanResult> scanDownloads() async {
    final downloads = Platform.isWindows
        ? '$_home\\Downloads'
        : '$_home/Downloads';
    final payload = await Isolate.run<Map<String, dynamic>>(
      () => _scanDownloadsPayload(downloads),
    );
    return _scanResultFromPayload(payload);
  }

  // ─── Top Folders (Space Lens) ─────────────────────────────────────────────

  Future<List<FileItem>> getTopFolders(
    String rootPath, {
    int limit = 25,
  }) async {
    final payload = await Isolate.run<List<Map<String, dynamic>>>(
      () => _topFoldersPayload(rootPath, limit),
    );
    return payload.map(_fileItemFromPayload).toList(growable: false);
  }

  // ─── Applications ─────────────────────────────────────────────────────────

  Future<ScanResult> scanApplications() async {
    final payload = await Isolate.run<Map<String, dynamic>>(
      _scanApplicationsPayload,
    );
    return _scanResultFromPayload(payload);
  }

  // ─── Helpers ──────────────────────────────────────────────────────────────

  String get _home =>
      Platform.environment[Platform.isWindows ? 'USERPROFILE' : 'HOME'] ?? '';
}

ScanResult _scanResultFromPayload(Map<String, dynamic> payload) {
  final items = (payload['items'] as List<dynamic>)
      .cast<Map<String, dynamic>>()
      .map(_fileItemFromPayload)
      .toList(growable: false);
  return ScanResult(
    items: items,
    totalBytes: payload['totalBytes'] as int,
    scanDuration: Duration(milliseconds: payload['scanDurationMs'] as int),
  );
}

Future<Map<String, dynamic>> _scanCleanupPayload(List<String> dirs) async {
  final sw = Stopwatch()..start();
  final items = <Map<String, dynamic>>[];
  for (final dir in dirs) {
    await _collectFilesPayload(dir, items, selectAll: true);
  }
  sw.stop();
  final total = items.fold<int>(0, (s, i) => s + (i['sizeBytes'] as int));
  return {
    'items': items,
    'totalBytes': total,
    'scanDurationMs': sw.elapsedMilliseconds,
  };
}

Future<Map<String, dynamic>> _scanLargeFilesPayload(
  String rootPath,
  int minSizeBytes,
) async {
  final sw = Stopwatch()..start();
  final items = <Map<String, dynamic>>[];
  try {
    await for (final entity in Directory(
      rootPath,
    ).list(recursive: true, followLinks: false)) {
      if (entity is File) {
        try {
          final stat = await entity.stat();
          if (stat.size >= minSizeBytes) {
            items.add(
              _fileItemToPayload(
                FileItem(
                  path: entity.path,
                  name: _basename(entity.path),
                  sizeBytes: stat.size,
                  modified: stat.modified,
                  isDirectory: false,
                ),
              ),
            );
          }
        } catch (_) {}
      }
    }
  } catch (_) {}

  items.sort(
    (a, b) => (b['sizeBytes'] as int).compareTo(a['sizeBytes'] as int),
  );
  sw.stop();
  final total = items.fold<int>(0, (s, i) => s + (i['sizeBytes'] as int));
  return {
    'items': items,
    'totalBytes': total,
    'scanDurationMs': sw.elapsedMilliseconds,
  };
}

Future<Map<String, dynamic>> _scanDownloadsPayload(String downloads) async {
  final sw = Stopwatch()..start();
  final items = <Map<String, dynamic>>[];
  await _collectFilesPayload(downloads, items, recursive: false);
  sw.stop();
  final total = items.fold<int>(0, (s, i) => s + (i['sizeBytes'] as int));
  return {
    'items': items,
    'totalBytes': total,
    'scanDurationMs': sw.elapsedMilliseconds,
  };
}

Future<List<Map<String, dynamic>>> _topFoldersPayload(
  String rootPath,
  int limit,
) async {
  final items = <Map<String, dynamic>>[];
  try {
    await for (final entity in Directory(rootPath).list(followLinks: false)) {
      if (entity is Directory) {
        try {
          final name = _basename(entity.path);
          if (name.startsWith('.')) continue;
          final size = await _dirSizePayload(entity.path);
          final stat = await entity.stat();
          items.add(
            _fileItemToPayload(
              FileItem(
                path: entity.path,
                name: name,
                sizeBytes: size,
                modified: stat.modified,
                isDirectory: true,
              ),
            ),
          );
        } catch (_) {}
      }
    }
  } catch (_) {}

  items.sort(
    (a, b) => (b['sizeBytes'] as int).compareTo(a['sizeBytes'] as int),
  );
  return items.take(limit).toList(growable: false);
}

Future<Map<String, dynamic>> _scanApplicationsPayload() async {
  final sw = Stopwatch()..start();
  final items = <Map<String, dynamic>>[];

  if (Platform.isMacOS) {
    final appsDir = Directory('/Applications');
    if (await appsDir.exists()) {
      await for (final entity in appsDir.list(followLinks: false)) {
        if (entity is Directory && entity.path.endsWith('.app')) {
          try {
            final name = _basename(entity.path).replaceAll('.app', '');
            final size = await _dirSizePayload(entity.path);
            final stat = await entity.stat();
            items.add(
              _fileItemToPayload(
                FileItem(
                  path: entity.path,
                  name: name,
                  sizeBytes: size,
                  modified: stat.modified,
                  isDirectory: true,
                ),
              ),
            );
          } catch (_) {}
        }
      }
    }
  } else if (Platform.isWindows) {
    for (final dir in [r'C:\Program Files', r'C:\Program Files (x86)']) {
      final d = Directory(dir);
      if (!await d.exists()) continue;
      await for (final entity in d.list(followLinks: false)) {
        if (entity is Directory) {
          try {
            final size = await _dirSizePayload(entity.path);
            final stat = await entity.stat();
            items.add(
              _fileItemToPayload(
                FileItem(
                  path: entity.path,
                  name: _basename(entity.path),
                  sizeBytes: size,
                  modified: stat.modified,
                  isDirectory: true,
                ),
              ),
            );
          } catch (_) {}
        }
      }
    }
  } else if (Platform.isLinux) {
    final optDir = Directory('/opt');
    if (await optDir.exists()) {
      await for (final entity in optDir.list(followLinks: false)) {
        if (entity is Directory) {
          try {
            final size = await _dirSizePayload(entity.path);
            final stat = await entity.stat();
            items.add(
              _fileItemToPayload(
                FileItem(
                  path: entity.path,
                  name: _basename(entity.path),
                  sizeBytes: size,
                  modified: stat.modified,
                  isDirectory: true,
                ),
              ),
            );
          } catch (_) {}
        }
      }
    }
  }

  items.sort(
    (a, b) => (b['sizeBytes'] as int).compareTo(a['sizeBytes'] as int),
  );
  sw.stop();
  final total = items.fold<int>(0, (s, i) => s + (i['sizeBytes'] as int));
  return {
    'items': items,
    'totalBytes': total,
    'scanDurationMs': sw.elapsedMilliseconds,
  };
}

Future<void> _collectFilesPayload(
  String dirPath,
  List<Map<String, dynamic>> out, {
  bool recursive = true,
  bool selectAll = false,
}) async {
  try {
    await for (final entity in Directory(
      dirPath,
    ).list(recursive: recursive, followLinks: false)) {
      if (entity is File) {
        try {
          final stat = await entity.stat();
          out.add(
            _fileItemToPayload(
              FileItem(
                path: entity.path,
                name: _basename(entity.path),
                sizeBytes: stat.size,
                modified: stat.modified,
                isDirectory: false,
                isSelected: selectAll,
              ),
            ),
          );
        } catch (_) {}
      }
    }
  } catch (_) {}
}

Future<int> _dirSizePayload(String path) async {
  int total = 0;
  try {
    await for (final entity in Directory(
      path,
    ).list(recursive: true, followLinks: false)) {
      if (entity is File) {
        try {
          final stat = await entity.stat();
          total += stat.size;
        } catch (_) {}
      }
    }
  } catch (_) {}
  return total;
}

String _basename(String path) => path.split(Platform.pathSeparator).last;

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
