import 'dart:io';
import 'dart:isolate';
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/file_item.dart';
import '../models/scan_result.dart';

final fileServiceProvider = Provider<FileService>((ref) => FileService());

typedef ScanProgressCallback = void Function(ScanProgress progress);

class _ScanTaskMessage {
  final String task;
  final Map<String, dynamic> args;
  final SendPort sendPort;
  final SendPort controlPort;

  const _ScanTaskMessage({
    required this.task,
    required this.args,
    required this.sendPort,
    required this.controlPort,
  });
}

class _ScanControlMessage {
  final String type;

  const _ScanControlMessage(this.type);
}

class _ProgressEmitter {
  final void Function(ScanProgress progress) emit;
  static const Duration _minInterval = Duration(milliseconds: 140);

  DateTime _lastSent = DateTime.fromMillisecondsSinceEpoch(0);
  double _lastPercent = -1;

  _ProgressEmitter({required this.emit});

  void push(
    ScanPhase phase,
    int processed,
    int total, {
    int processedBytes = 0,
    bool force = false,
  }) {
    final progress = ScanProgress(
      phase: phase,
      processed: processed,
      total: total,
      processedBytes: processedBytes,
    );
    final now = DateTime.now();
    final elapsed = now.difference(_lastSent);
    final percent = progress.percent;
    final changedEnough = (percent - _lastPercent).abs() >= 0.01;
    final finished = total > 0 && processed >= total;
    if (force || finished || changedEnough || elapsed >= _minInterval) {
      emit(progress);
      _lastSent = now;
      _lastPercent = percent;
    }
  }
}

class ScanCancelledException implements Exception {
  const ScanCancelledException();

  @override
  String toString() => 'Scan cancelled';
}

class FileService {
  Isolate? _activeScanIsolate;
  Completer<Map<String, dynamic>>? _activeScanCompleter;
  SendPort? _activeScanControlPort;

  void cancelActiveScan() {
    _activeScanControlPort?.send(const _ScanControlMessage('cancel'));
    final completer = _activeScanCompleter;
    if (completer != null && !completer.isCompleted) {
      completer.completeError(const ScanCancelledException());
    }
    _activeScanIsolate?.kill(priority: Isolate.immediate);
  }

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

  Future<ScanResult> scanCleanup({ScanProgressCallback? onProgress}) async {
    final payload = await _runScanPayloadTask(
      task: 'scanCleanup',
      args: {'dirs': _cleanupDirs()},
      onProgress: onProgress,
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
    ScanProgressCallback? onProgress,
  }) async {
    final payload = await _runScanPayloadTask(
      task: 'scanLargeFiles',
      args: {'rootPath': rootPath, 'minSizeBytes': minSizeBytes},
      onProgress: onProgress,
    );
    return _scanResultFromPayload(payload);
  }

  // ─── Downloads ────────────────────────────────────────────────────────────

  Future<ScanResult> scanDownloads({ScanProgressCallback? onProgress}) async {
    final downloads = Platform.isWindows
        ? '$_home\\Downloads'
        : '$_home/Downloads';
    final payload = await _runScanPayloadTask(
      task: 'scanDownloads',
      args: {'downloads': downloads},
      onProgress: onProgress,
    );
    return _scanResultFromPayload(payload);
  }

  // ─── Top Folders (Space Lens) ─────────────────────────────────────────────

  Future<List<FileItem>> getTopFolders(
    String rootPath, {
    int limit = 25,
    ScanProgressCallback? onProgress,
  }) async {
    final payload = await _runScanPayloadTask(
      task: 'topFolders',
      args: {'rootPath': rootPath, 'limit': limit},
      onProgress: onProgress,
    );
    final itemsPayload = (payload['items'] as List<dynamic>)
        .cast<Map<String, dynamic>>();
    return itemsPayload.map(_fileItemFromPayload).toList(growable: false);
  }

  // ─── Applications ─────────────────────────────────────────────────────────

  Future<ScanResult> scanApplications({
    ScanProgressCallback? onProgress,
  }) async {
    final payload = await _runScanPayloadTask(
      task: 'scanApplications',
      args: const {},
      onProgress: onProgress,
    );
    return _scanResultFromPayload(payload);
  }

  // ─── Helpers ──────────────────────────────────────────────────────────────

  String get _home =>
      Platform.environment[Platform.isWindows ? 'USERPROFILE' : 'HOME'] ?? '';

  Future<Map<String, dynamic>> _runScanPayloadTask({
    required String task,
    required Map<String, dynamic> args,
    ScanProgressCallback? onProgress,
  }) async {
    final receivePort = ReceivePort();
    final controlPort = ReceivePort();
    final errorPort = ReceivePort();
    final completer = Completer<Map<String, dynamic>>();
    StreamSubscription<dynamic>? dataSub;
    StreamSubscription<dynamic>? errSub;

    _activeScanCompleter = completer;

    controlPort.listen((dynamic message) {
      if (message is SendPort) {
        _activeScanControlPort = message;
      }
    });

    final isolate = await Isolate.spawn<_ScanTaskMessage>(
      _scanTaskIsolateEntry,
      _ScanTaskMessage(
        task: task,
        args: args,
        sendPort: receivePort.sendPort,
        controlPort: controlPort.sendPort,
      ),
      onError: errorPort.sendPort,
      errorsAreFatal: true,
    );
    _activeScanIsolate = isolate;

    dataSub = receivePort.listen((dynamic message) {
      if (completer.isCompleted) return;
      if (message is! Map) return;
      final type = message['type'] as String?;
      if (type == 'progress') {
        if (onProgress != null) {
          onProgress(
            ScanProgress(
              phase: _scanPhaseFromName(
                (message['phase'] as String?) ?? 'scanning',
              ),
              processed: message['processed'] as int? ?? 0,
              total: message['total'] as int? ?? 0,
              processedBytes: message['processedBytes'] as int? ?? 0,
            ),
          );
        }
      } else if (type == 'result') {
        completer.complete((message['payload'] as Map).cast<String, dynamic>());
      } else if (type == 'error') {
        completer.completeError(
          Exception((message['message'] as String?) ?? 'Scan failed'),
        );
      }
    });

    errSub = errorPort.listen((dynamic message) {
      if (!completer.isCompleted) {
        completer.completeError(Exception('Isolate error: $message'));
      }
    });

    try {
      return await completer.future;
    } finally {
      await dataSub.cancel();
      controlPort.close();
      await errSub.cancel();
      receivePort.close();
      errorPort.close();
      if (identical(_activeScanCompleter, completer)) {
        _activeScanCompleter = null;
        _activeScanIsolate = null;
        _activeScanControlPort = null;
      }
      isolate.kill(priority: Isolate.immediate);
    }
  }
}

ScanPhase _scanPhaseFromName(String value) {
  if (value == 'counting') return ScanPhase.counting;
  return ScanPhase.scanning;
}

void _scanTaskIsolateEntry(_ScanTaskMessage message) async {
  final send = message.sendPort;
  var cancelled = false;

  final controlSub = ReceivePort();
  message.controlPort.send(controlSub.sendPort);
  controlSub.listen((dynamic controlMessage) {
    if (controlMessage is _ScanControlMessage &&
        controlMessage.type == 'cancel') {
      cancelled = true;
    }
  });

  void emitProgress(ScanProgress progress) {
    if (cancelled) return;
    send.send({
      'type': 'progress',
      'phase': progress.phase.name,
      'processed': progress.processed,
      'total': progress.total,
      'processedBytes': progress.processedBytes,
    });
  }

  try {
    final task = message.task;
    final args = message.args;
    late final Map<String, dynamic> payload;

    if (task == 'scanCleanup') {
      final dirs = (args['dirs'] as List<dynamic>).cast<String>();
      payload = await _scanCleanupPayload(dirs, emitProgress, () => cancelled);
    } else if (task == 'scanLargeFiles') {
      payload = await _scanLargeFilesPayload(
        args['rootPath'] as String,
        args['minSizeBytes'] as int,
        emitProgress,
        () => cancelled,
      );
    } else if (task == 'scanDownloads') {
      payload = await _scanDownloadsPayload(
        args['downloads'] as String,
        emitProgress,
        () => cancelled,
      );
    } else if (task == 'topFolders') {
      payload = await _topFoldersPayload(
        args['rootPath'] as String,
        args['limit'] as int,
        emitProgress,
        () => cancelled,
      );
    } else if (task == 'scanApplications') {
      payload = await _scanApplicationsPayload(emitProgress, () => cancelled);
    } else {
      throw StateError('Unknown scan task: $task');
    }

    if (cancelled) {
      throw const ScanCancelledException();
    }

    send.send({'type': 'result', 'payload': payload});
    controlSub.close();
  } catch (e) {
    controlSub.close();
    if (cancelled || e is ScanCancelledException) {
      send.send({'type': 'error', 'message': 'Scan cancelled'});
      return;
    }
    send.send({'type': 'error', 'message': e.toString()});
  }
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

Future<Map<String, dynamic>> _scanCleanupPayload(
  List<String> dirs,
  void Function(ScanProgress progress) onProgress,
  bool Function() isCancelled,
) async {
  final sw = Stopwatch()..start();
  final items = <Map<String, dynamic>>[];
  int processed = 0;
  int processedBytes = 0;

  if (isCancelled()) throw const ScanCancelledException();

  onProgress(
    const ScanProgress(phase: ScanPhase.counting, processed: 0, total: 0),
  );
  if (isCancelled()) throw const ScanCancelledException();
  final totalFiles = await _countFilesAcrossDirs(dirs, recursive: true);
  if (isCancelled()) throw const ScanCancelledException();
  final emitter = _ProgressEmitter(emit: onProgress);
  emitter.push(
    ScanPhase.scanning,
    0,
    totalFiles,
    processedBytes: 0,
    force: true,
  );

  for (final dir in dirs) {
    await _collectFilesPayload(
      dir,
      items,
      selectAll: true,
      isCancelled: isCancelled,
      onTick: (deltaItems, deltaBytes) {
        processed += deltaItems;
        processedBytes += deltaBytes;
        emitter.push(
          ScanPhase.scanning,
          processed,
          totalFiles,
          processedBytes: processedBytes,
        );
      },
    );
  }
  emitter.push(
    ScanPhase.scanning,
    totalFiles,
    totalFiles,
    processedBytes: processedBytes,
    force: true,
  );

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
  void Function(ScanProgress progress) onProgress,
  bool Function() isCancelled,
) async {
  final sw = Stopwatch()..start();
  final items = <Map<String, dynamic>>[];
  int processed = 0;
  int processedBytes = 0;

  if (isCancelled()) throw const ScanCancelledException();

  onProgress(
    const ScanProgress(phase: ScanPhase.counting, processed: 0, total: 0),
  );
  if (isCancelled()) throw const ScanCancelledException();
  final totalFiles = await _countFilesInDir(rootPath, recursive: true);
  if (isCancelled()) throw const ScanCancelledException();
  final emitter = _ProgressEmitter(emit: onProgress);
  emitter.push(
    ScanPhase.scanning,
    0,
    totalFiles,
    processedBytes: 0,
    force: true,
  );

  try {
    await for (final entity in Directory(
      rootPath,
    ).list(recursive: true, followLinks: false)) {
      if (isCancelled()) throw const ScanCancelledException();
      if (entity is File) {
        try {
          final stat = await entity.stat();
          if (isCancelled()) throw const ScanCancelledException();
          processed++;
          processedBytes += stat.size;
          emitter.push(
            ScanPhase.scanning,
            processed,
            totalFiles,
            processedBytes: processedBytes,
          );
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

  emitter.push(
    ScanPhase.scanning,
    totalFiles,
    totalFiles,
    processedBytes: processedBytes,
    force: true,
  );

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

Future<Map<String, dynamic>> _scanDownloadsPayload(
  String downloads,
  void Function(ScanProgress progress) onProgress,
  bool Function() isCancelled,
) async {
  final sw = Stopwatch()..start();
  final items = <Map<String, dynamic>>[];
  int processed = 0;
  int processedBytes = 0;

  if (isCancelled()) throw const ScanCancelledException();

  onProgress(
    const ScanProgress(phase: ScanPhase.counting, processed: 0, total: 0),
  );
  if (isCancelled()) throw const ScanCancelledException();
  final totalFiles = await _countFilesInDir(downloads, recursive: false);
  if (isCancelled()) throw const ScanCancelledException();
  final emitter = _ProgressEmitter(emit: onProgress);
  emitter.push(
    ScanPhase.scanning,
    0,
    totalFiles,
    processedBytes: 0,
    force: true,
  );

  await _collectFilesPayload(
    downloads,
    items,
    recursive: false,
    isCancelled: isCancelled,
    onTick: (deltaItems, deltaBytes) {
      processed += deltaItems;
      processedBytes += deltaBytes;
      emitter.push(
        ScanPhase.scanning,
        processed,
        totalFiles,
        processedBytes: processedBytes,
      );
    },
  );

  emitter.push(
    ScanPhase.scanning,
    totalFiles,
    totalFiles,
    processedBytes: processedBytes,
    force: true,
  );

  sw.stop();
  final total = items.fold<int>(0, (s, i) => s + (i['sizeBytes'] as int));
  return {
    'items': items,
    'totalBytes': total,
    'scanDurationMs': sw.elapsedMilliseconds,
  };
}

Future<Map<String, dynamic>> _topFoldersPayload(
  String rootPath,
  int limit,
  void Function(ScanProgress progress) onProgress,
  bool Function() isCancelled,
) async {
  if (isCancelled()) throw const ScanCancelledException();
  onProgress(
    const ScanProgress(phase: ScanPhase.counting, processed: 0, total: 0),
  );
  if (isCancelled()) throw const ScanCancelledException();
  final items = <Map<String, dynamic>>[];
  final candidates = await _collectTopFolderCandidates(rootPath);
  if (isCancelled()) throw const ScanCancelledException();
  final emitter = _ProgressEmitter(emit: onProgress);
  emitter.push(ScanPhase.scanning, 0, candidates.length, force: true);
  int processed = 0;
  int processedBytes = 0;

  try {
    for (final entity in candidates) {
      if (isCancelled()) throw const ScanCancelledException();
      try {
        final name = _basename(entity.path);
        final size = await _dirSizePayload(entity.path);
        if (isCancelled()) throw const ScanCancelledException();
        final stat = await entity.stat();
        processed++;
        processedBytes += size;
        emitter.push(
          ScanPhase.scanning,
          processed,
          candidates.length,
          processedBytes: processedBytes,
        );
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
  } catch (_) {}

  emitter.push(
    ScanPhase.scanning,
    candidates.length,
    candidates.length,
    processedBytes: processedBytes,
    force: true,
  );

  items.sort(
    (a, b) => (b['sizeBytes'] as int).compareTo(a['sizeBytes'] as int),
  );
  return {
    'items': items.take(limit).toList(growable: false),
    'totalBytes': items.fold<int>(0, (s, i) => s + (i['sizeBytes'] as int)),
    'scanDurationMs': 0,
  };
}

Future<Map<String, dynamic>> _scanApplicationsPayload(
  void Function(ScanProgress progress) onProgress,
  bool Function() isCancelled,
) async {
  final sw = Stopwatch()..start();
  final items = <Map<String, dynamic>>[];

  if (isCancelled()) throw const ScanCancelledException();

  onProgress(
    const ScanProgress(phase: ScanPhase.counting, processed: 0, total: 0),
  );
  if (isCancelled()) throw const ScanCancelledException();
  final candidates = await _collectApplicationCandidates();
  if (isCancelled()) throw const ScanCancelledException();
  final emitter = _ProgressEmitter(emit: onProgress);
  emitter.push(ScanPhase.scanning, 0, candidates.length, force: true);

  int processed = 0;
  int processedBytes = 0;

  for (final dir in candidates) {
    if (isCancelled()) throw const ScanCancelledException();
    try {
      final size = await _dirSizePayload(dir.path);
      if (isCancelled()) throw const ScanCancelledException();
      final stat = await dir.stat();
      final rawName = _basename(dir.path);
      final name = Platform.isMacOS ? rawName.replaceAll('.app', '') : rawName;
      processed++;
      processedBytes += size;
      emitter.push(
        ScanPhase.scanning,
        processed,
        candidates.length,
        processedBytes: processedBytes,
      );
      items.add(
        _fileItemToPayload(
          FileItem(
            path: dir.path,
            name: name,
            sizeBytes: size,
            modified: stat.modified,
            iconPath: await _resolveApplicationIconPath(dir.path),
            lastUsed: stat.accessed,
            isDirectory: true,
          ),
        ),
      );
    } catch (_) {}
  }

  emitter.push(
    ScanPhase.scanning,
    candidates.length,
    candidates.length,
    processedBytes: processedBytes,
    force: true,
  );

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
  bool Function()? isCancelled,
  void Function(int deltaItems, int deltaBytes)? onTick,
}) async {
  try {
    await for (final entity in Directory(
      dirPath,
    ).list(recursive: recursive, followLinks: false)) {
      if (isCancelled?.call() ?? false) throw const ScanCancelledException();
      if (entity is File) {
        try {
          final stat = await entity.stat();
          if (isCancelled?.call() ?? false) {
            throw const ScanCancelledException();
          }
          onTick?.call(1, stat.size);
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

Future<int> _countFilesAcrossDirs(
  List<String> dirs, {
  required bool recursive,
}) async {
  int total = 0;
  for (final dir in dirs) {
    total += await _countFilesInDir(dir, recursive: recursive);
  }
  return total;
}

Future<int> _countFilesInDir(String dirPath, {required bool recursive}) async {
  int count = 0;
  try {
    await for (final entity in Directory(
      dirPath,
    ).list(recursive: recursive, followLinks: false)) {
      if (entity is File) {
        count++;
      }
    }
  } catch (_) {}
  return count;
}

Future<List<Directory>> _collectTopFolderCandidates(String rootPath) async {
  final dirs = <Directory>[];
  try {
    await for (final entity in Directory(rootPath).list(followLinks: false)) {
      if (entity is Directory) {
        final name = _basename(entity.path);
        if (name.startsWith('.')) continue;
        dirs.add(entity);
      }
    }
  } catch (_) {}
  return dirs;
}

Future<List<Directory>> _collectApplicationCandidates() async {
  final dirs = <Directory>[];
  if (Platform.isMacOS) {
    final appsDir = Directory('/Applications');
    if (await appsDir.exists()) {
      await for (final entity in appsDir.list(followLinks: false)) {
        if (entity is Directory && entity.path.endsWith('.app')) {
          dirs.add(entity);
        }
      }
    }
  } else if (Platform.isWindows) {
    for (final dir in [r'C:\Program Files', r'C:\Program Files (x86)']) {
      final root = Directory(dir);
      if (!await root.exists()) continue;
      await for (final entity in root.list(followLinks: false)) {
        if (entity is Directory) {
          dirs.add(entity);
        }
      }
    }
  } else if (Platform.isLinux) {
    final optDir = Directory('/opt');
    if (await optDir.exists()) {
      await for (final entity in optDir.list(followLinks: false)) {
        if (entity is Directory) {
          dirs.add(entity);
        }
      }
    }
  }
  return dirs;
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

Future<String?> _resolveApplicationIconPath(String appPath) async {
  if (!Platform.isMacOS || !appPath.endsWith('.app')) return null;
  final resourcesDir = Directory('$appPath/Contents/Resources');
  if (!await resourcesDir.exists()) return null;

  final candidates = <String>{'AppIcon', 'icon'};
  final infoPlist = File('$appPath/Contents/Info.plist');
  if (await infoPlist.exists()) {
    try {
      final content = await infoPlist.readAsString();
      final iconFileMatch = RegExp(
        r'<key>\\s*CFBundleIconFile\\s*</key>\\s*<string>([^<]+)</string>',
      ).firstMatch(content);
      final iconNameMatch = RegExp(
        r'<key>\\s*CFBundleIconName\\s*</key>\\s*<string>([^<]+)</string>',
      ).firstMatch(content);
      final iconFile = iconFileMatch?.group(1)?.trim();
      final iconName = iconNameMatch?.group(1)?.trim();
      if (iconFile != null && iconFile.isNotEmpty) {
        candidates.add(iconFile.replaceAll('.icns', '').replaceAll('.png', ''));
      }
      if (iconName != null && iconName.isNotEmpty) {
        candidates.add(iconName.replaceAll('.icns', '').replaceAll('.png', ''));
      }
    } catch (_) {}
  }

  const exts = ['.png', '.jpg', '.jpeg', '.webp'];
  for (final base in candidates) {
    for (final ext in exts) {
      final path = '${resourcesDir.path}/$base$ext';
      if (await File(path).exists()) return path;
    }
  }

  try {
    await for (final entity in resourcesDir.list(followLinks: false)) {
      if (entity is! File) continue;
      final name = _basename(entity.path).toLowerCase();
      final isImage = exts.any((ext) => name.endsWith(ext));
      if (!isImage) continue;
      if (name.contains('icon') || name.contains('app')) return entity.path;
    }
  } catch (_) {}

  return null;
}

String _basename(String path) => path.split(Platform.pathSeparator).last;

Map<String, dynamic> _fileItemToPayload(FileItem item) => {
  'path': item.path,
  'name': item.name,
  'sizeBytes': item.sizeBytes,
  'modifiedMs': item.modified.millisecondsSinceEpoch,
  'iconPath': item.iconPath,
  'lastUsedMs': item.lastUsed?.millisecondsSinceEpoch,
  'isDirectory': item.isDirectory,
  'isSelected': item.isSelected,
};

FileItem _fileItemFromPayload(Map<String, dynamic> payload) {
  return FileItem(
    path: payload['path'] as String,
    name: payload['name'] as String,
    sizeBytes: payload['sizeBytes'] as int,
    modified: DateTime.fromMillisecondsSinceEpoch(payload['modifiedMs'] as int),
    iconPath: payload['iconPath'] as String?,
    lastUsed: payload['lastUsedMs'] == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(payload['lastUsedMs'] as int),
    isDirectory: payload['isDirectory'] as bool,
    isSelected: payload['isSelected'] as bool,
  );
}
