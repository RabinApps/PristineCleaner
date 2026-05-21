import 'dart:io';
import 'dart:isolate';
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;

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

class _ActiveScanTask {
  final Completer<Map<String, dynamic>> completer;
  Isolate? isolate;
  SendPort? controlPort;

  _ActiveScanTask({required this.completer});
}

class FileService {
  final Map<int, _ActiveScanTask> _activeScanTasks = {};
  int _nextScanTaskId = 0;

  void cancelActiveScan() {
    final tasks = _activeScanTasks.values.toList(growable: false);
    for (final task in tasks) {
      task.controlPort?.send(const _ScanControlMessage('cancel'));
      if (!task.completer.isCompleted) {
        task.completer.completeError(const ScanCancelledException());
      }
      task.isolate?.kill(priority: Isolate.immediate);
    }
    _activeScanTasks.clear();
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
      task: 'scanCleanupCategorized',
      args: {'categories': _cleanupCategoryDirs()},
      onProgress: onProgress,
    );
    return _scanResultFromPayload(payload);
  }

  Map<String, List<String>> _cleanupCategoryDirs() {
    final home = _home;
    if (Platform.isMacOS) {
      return {
        'user_cache': ['$home/Library/Caches'],
        'user_logs': ['$home/Library/Logs'],
        'language_files': ['/System/Library/LinguisticData'],
        'system_logs': ['/Library/Logs'],
        'broken_login_items': [],
      };
    } else if (Platform.isLinux) {
      return {
        'user_cache': ['$home/.cache'],
        'user_logs': ['/var/log'],
        'language_files': ['/usr/share/locale'],
        'system_logs': ['/tmp'],
        'broken_login_items': [],
      };
    } else if (Platform.isWindows) {
      final tmp = Platform.environment['TEMP'] ?? '';
      final local = Platform.environment['LOCALAPPDATA'] ?? '';
      final windir = Platform.environment['WINDIR'] ?? r'C:\Windows';
      return {
        'user_cache': ['$local\\Temp'],
        'user_logs': [],
        'language_files': ['$windir\\System32'],
        'system_logs': [tmp],
        'broken_login_items': [],
      };
    }
    return {};
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

  // ─── Fresh Duplicates ────────────────────────────────────────────────────

  Future<ScanResult> scanFreshDuplicates(
    String rootPath, {
    Duration freshWindow = const Duration(days: 90),
    ScanProgressCallback? onProgress,
  }) async {
    final cutoffMs = DateTime.now()
        .subtract(freshWindow)
        .millisecondsSinceEpoch;
    final payload = await _runScanPayloadTask(
      task: 'scanFreshDuplicates',
      args: {'rootPath': rootPath, 'cutoffMs': cutoffMs},
      onProgress: onProgress,
    );
    return _scanResultFromPayload(payload);
  }

  // ─── Large Similar Images ────────────────────────────────────────────────

  Future<ScanResult> scanLargeSimilarImages(
    String rootPath, {
    int minSizeBytes = 5 * 1024 * 1024,
    int maxHammingDistance = 8,
    ScanProgressCallback? onProgress,
  }) async {
    final payload = await _runScanPayloadTask(
      task: 'scanLargeSimilarImages',
      args: {
        'rootPath': rootPath,
        'minSizeBytes': minSizeBytes,
        'maxHammingDistance': maxHammingDistance,
      },
      onProgress: onProgress,
    );
    return _scanResultFromPayload(payload);
  }

  // ─── Large and Old Files ─────────────────────────────────────────────────

  Future<ScanResult> scanLargeAndOldFiles(
    String rootPath, {
    int minSizeBytes = 500 * 1024 * 1024,
    Duration minAge = const Duration(days: 365),
    ScanProgressCallback? onProgress,
  }) async {
    final modifiedBeforeMs = DateTime.now()
        .subtract(minAge)
        .millisecondsSinceEpoch;
    final payload = await _runScanPayloadTask(
      task: 'scanLargeAndOldFiles',
      args: {
        'rootPath': rootPath,
        'minSizeBytes': minSizeBytes,
        'modifiedBeforeMs': modifiedBeforeMs,
      },
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

  // ─── Directory Browser ─────────────────────────────────────────────────────

  Future<List<FileItem>> listDirectoryContents(
    String dirPath, {
    bool includeHidden = false,
    int maxItems = 500,
  }) async {
    final out = <FileItem>[];
    try {
      final dir = Directory(dirPath);
      if (!await dir.exists()) return out;

      await for (final entity in dir.list(followLinks: false)) {
        if (out.length >= maxItems) break;

        final path = entity.path;
        final name = _basename(path);
        if (!includeHidden && name.startsWith('.')) {
          continue;
        }

        try {
          final stat = await entity.stat();
          final isDir = entity is Directory;
          out.add(
            FileItem(
              path: path,
              name: name,
              sizeBytes: isDir ? await _dirSizePayload(path) : stat.size,
              modified: stat.modified,
              isDirectory: isDir,
            ),
          );
        } catch (_) {}
      }
    } catch (_) {}

    out.sort((a, b) {
      if (a.isDirectory != b.isDirectory) {
        return a.isDirectory ? -1 : 1;
      }
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    return out;
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
    final taskId = _nextScanTaskId++;
    final receivePort = ReceivePort();
    final controlPort = ReceivePort();
    final errorPort = ReceivePort();
    final completer = Completer<Map<String, dynamic>>();
    final activeTask = _ActiveScanTask(completer: completer);
    StreamSubscription<dynamic>? dataSub;
    StreamSubscription<dynamic>? errSub;
    StreamSubscription<dynamic>? controlSub;

    _activeScanTasks[taskId] = activeTask;

    controlSub = controlPort.listen((dynamic message) {
      if (message is SendPort) {
        activeTask.controlPort = message;
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
    activeTask.isolate = isolate;

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
      await controlSub.cancel();
      controlPort.close();
      await errSub.cancel();
      receivePort.close();
      errorPort.close();
      _activeScanTasks.remove(taskId);
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

    if (task == 'scanCleanupCategorized') {
      final rawCategories = (args['categories'] as Map<dynamic, dynamic>)
          .cast<String, dynamic>();
      final categories = rawCategories.map(
        (k, v) => MapEntry(k, (v as List<dynamic>).cast<String>()),
      );
      payload = await _scanCleanupCategorizedPayload(
        categories,
        emitProgress,
        () => cancelled,
      );
    } else if (task == 'scanCleanup') {
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
    } else if (task == 'scanFreshDuplicates') {
      payload = await _scanFreshDuplicatesPayload(
        args['rootPath'] as String,
        args['cutoffMs'] as int,
        emitProgress,
        () => cancelled,
      );
    } else if (task == 'scanLargeSimilarImages') {
      payload = await _scanLargeSimilarImagesPayload(
        args['rootPath'] as String,
        args['minSizeBytes'] as int,
        args['maxHammingDistance'] as int,
        emitProgress,
        () => cancelled,
      );
    } else if (task == 'scanLargeAndOldFiles') {
      payload = await _scanLargeAndOldFilesPayload(
        args['rootPath'] as String,
        args['minSizeBytes'] as int,
        args['modifiedBeforeMs'] as int,
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

Future<Map<String, dynamic>> _scanCleanupCategorizedPayload(
  Map<String, List<String>> categories,
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

  final allDirs = categories.values.expand((v) => v).toList();
  if (isCancelled()) throw const ScanCancelledException();
  final totalFiles = await _countFilesAcrossDirs(allDirs, recursive: true);
  if (isCancelled()) throw const ScanCancelledException();

  final emitter = _ProgressEmitter(emit: onProgress);
  emitter.push(
    ScanPhase.scanning,
    0,
    totalFiles,
    processedBytes: 0,
    force: true,
  );

  for (final entry in categories.entries) {
    final categoryId = entry.key;
    final dirs = entry.value;
    for (final dir in dirs) {
      if (isCancelled()) throw const ScanCancelledException();
      await _collectCategorizedFilesPayload(
        dir,
        categoryId,
        items,
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

Future<void> _collectCategorizedFilesPayload(
  String dirPath,
  String categoryId,
  List<Map<String, dynamic>> out, {
  bool Function()? isCancelled,
  void Function(int deltaItems, int deltaBytes)? onTick,
}) async {
  final sep = Platform.pathSeparator;
  final rootPrefix = dirPath.endsWith(sep) ? dirPath : '$dirPath$sep';

  try {
    await for (final entity in Directory(
      dirPath,
    ).list(recursive: true, followLinks: false)) {
      if (isCancelled?.call() ?? false) throw const ScanCancelledException();
      if (entity is File) {
        try {
          final stat = await entity.stat();
          if (isCancelled?.call() ?? false) {
            throw const ScanCancelledException();
          }

          // Determine group: first path segment within the root dir.
          String? group;
          if (entity.path.startsWith(rootPrefix)) {
            final rest = entity.path.substring(rootPrefix.length);
            final firstSep = rest.indexOf(sep);
            group = firstSep == -1 ? rest : rest.substring(0, firstSep);
          }

          onTick?.call(1, stat.size);
          out.add({
            ..._fileItemToPayload(
              FileItem(
                path: entity.path,
                name: _basename(entity.path),
                sizeBytes: stat.size,
                modified: stat.modified,
                isDirectory: false,
                isSelected: true,
                category: categoryId,
                group: group,
              ),
            ),
          });
        } catch (_) {}
      }
    }
  } catch (_) {}
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

Future<Map<String, dynamic>> _scanFreshDuplicatesPayload(
  String rootPath,
  int cutoffMs,
  void Function(ScanProgress progress) onProgress,
  bool Function() isCancelled,
) async {
  final sw = Stopwatch()..start();
  final groups = <String, List<_FileScanCandidate>>{};
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
      if (entity is! File) continue;

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

        final modifiedMs = stat.modified.millisecondsSinceEpoch;
        if (modifiedMs < cutoffMs || stat.size <= 0) continue;

        final contentHash = await _hashFileContentFnv64(entity.path);
        if (isCancelled()) throw const ScanCancelledException();
        if (contentHash == null) continue;

        final key = '${stat.size}:$contentHash';
        groups
            .putIfAbsent(key, () => <_FileScanCandidate>[])
            .add(
              _FileScanCandidate(
                path: entity.path,
                name: _basename(entity.path),
                sizeBytes: stat.size,
                modified: stat.modified,
              ),
            );
      } catch (_) {}
    }
  } catch (_) {}

  final items = <Map<String, dynamic>>[];
  int clusterNo = 0;
  final sortedGroupKeys = groups.keys.toList()..sort();
  for (final key in sortedGroupKeys) {
    if (isCancelled()) throw const ScanCancelledException();
    final candidates = groups[key]!;
    if (candidates.length < 2) continue;

    clusterNo++;
    candidates.sort((a, b) => b.modified.compareTo(a.modified));
    final groupName = 'Duplicate Group $clusterNo';

    for (var i = 0; i < candidates.length; i++) {
      final c = candidates[i];
      items.add(
        _fileItemToPayload(
          FileItem(
            path: c.path,
            name: c.name,
            sizeBytes: c.sizeBytes,
            modified: c.modified,
            isDirectory: false,
            isSelected: i != 0,
            category: 'fresh_duplicates',
            group: groupName,
          ),
        ),
      );
    }
  }

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

Future<Map<String, dynamic>> _scanLargeSimilarImagesPayload(
  String rootPath,
  int minSizeBytes,
  int maxHammingDistance,
  void Function(ScanProgress progress) onProgress,
  bool Function() isCancelled,
) async {
  final sw = Stopwatch()..start();
  final candidates = <_ImageHashCandidate>[];
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
      if (entity is! File) continue;

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

        if (stat.size < minSizeBytes || !_isSupportedImagePath(entity.path)) {
          continue;
        }

        final hash = await _averageImageHash64(entity.path);
        if (isCancelled()) throw const ScanCancelledException();
        if (hash == null) continue;

        candidates.add(
          _ImageHashCandidate(
            path: entity.path,
            name: _basename(entity.path),
            sizeBytes: stat.size,
            modified: stat.modified,
            hashHex: hash,
          ),
        );
      } catch (_) {}
    }
  } catch (_) {}

  final dsu = _DisjointSet(candidates.length);
  for (var i = 0; i < candidates.length; i++) {
    if (isCancelled()) throw const ScanCancelledException();
    for (var j = i + 1; j < candidates.length; j++) {
      final distance = _hammingDistance64(
        candidates[i].hashHex,
        candidates[j].hashHex,
      );
      if (distance <= maxHammingDistance) {
        dsu.union(i, j);
      }
    }
  }

  final clustered = <int, List<_ImageHashCandidate>>{};
  for (var i = 0; i < candidates.length; i++) {
    final root = dsu.find(i);
    clustered
        .putIfAbsent(root, () => <_ImageHashCandidate>[])
        .add(candidates[i]);
  }

  final items = <Map<String, dynamic>>[];
  int clusterNo = 0;
  final clusterKeys = clustered.keys.toList()..sort();
  for (final key in clusterKeys) {
    if (isCancelled()) throw const ScanCancelledException();
    final cluster = clustered[key]!;
    if (cluster.length < 2) continue;

    clusterNo++;
    cluster.sort((a, b) {
      final sizeCmp = b.sizeBytes.compareTo(a.sizeBytes);
      if (sizeCmp != 0) return sizeCmp;
      return b.modified.compareTo(a.modified);
    });

    final groupName = 'Similar Images $clusterNo';
    for (var i = 0; i < cluster.length; i++) {
      final c = cluster[i];
      items.add(
        _fileItemToPayload(
          FileItem(
            path: c.path,
            name: c.name,
            sizeBytes: c.sizeBytes,
            modified: c.modified,
            isDirectory: false,
            isSelected: i != 0,
            category: 'large_similar_images',
            group: groupName,
          ),
        ),
      );
    }
  }

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

Future<Map<String, dynamic>> _scanLargeAndOldFilesPayload(
  String rootPath,
  int minSizeBytes,
  int modifiedBeforeMs,
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
      if (entity is! File) continue;

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

        if (stat.size < minSizeBytes) continue;
        if (stat.modified.millisecondsSinceEpoch > modifiedBeforeMs) continue;

        items.add(
          _fileItemToPayload(
            FileItem(
              path: entity.path,
              name: _basename(entity.path),
              sizeBytes: stat.size,
              modified: stat.modified,
              isDirectory: false,
              isSelected: true,
              category: 'large_and_old_files',
            ),
          ),
        );
      } catch (_) {}
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

class _FileScanCandidate {
  final String path;
  final String name;
  final int sizeBytes;
  final DateTime modified;

  const _FileScanCandidate({
    required this.path,
    required this.name,
    required this.sizeBytes,
    required this.modified,
  });
}

class _ImageHashCandidate extends _FileScanCandidate {
  final String hashHex;

  const _ImageHashCandidate({
    required super.path,
    required super.name,
    required super.sizeBytes,
    required super.modified,
    required this.hashHex,
  });
}

class _DisjointSet {
  final List<int> _parent;
  final List<int> _rank;

  _DisjointSet(int size)
    : _parent = List<int>.generate(size, (i) => i),
      _rank = List<int>.filled(size, 0);

  int find(int x) {
    if (_parent[x] != x) {
      _parent[x] = find(_parent[x]);
    }
    return _parent[x];
  }

  void union(int a, int b) {
    var ra = find(a);
    var rb = find(b);
    if (ra == rb) return;
    if (_rank[ra] < _rank[rb]) {
      final t = ra;
      ra = rb;
      rb = t;
    }
    _parent[rb] = ra;
    if (_rank[ra] == _rank[rb]) {
      _rank[ra]++;
    }
  }
}

bool _isSupportedImagePath(String path) {
  final lower = path.toLowerCase();
  return lower.endsWith('.jpg') ||
      lower.endsWith('.jpeg') ||
      lower.endsWith('.png') ||
      lower.endsWith('.webp') ||
      lower.endsWith('.bmp') ||
      lower.endsWith('.gif') ||
      lower.endsWith('.tif') ||
      lower.endsWith('.tiff');
}

Future<String?> _hashFileContentFnv64(String path) async {
  const mask64 = 0xFFFFFFFFFFFFFFFF;
  var hash = 0xCBF29CE484222325;
  const prime = 0x100000001B3;

  try {
    await for (final chunk in File(path).openRead()) {
      for (final b in chunk) {
        hash ^= b;
        hash = (hash * prime) & mask64;
      }
    }
    return hash.toRadixString(16).padLeft(16, '0');
  } catch (_) {
    return null;
  }
}

Future<String?> _averageImageHash64(String path) async {
  try {
    final bytes = await File(path).readAsBytes();
    final decoded = img.decodeImage(bytes);
    if (decoded == null) return null;

    final resized = img.copyResize(
      decoded,
      width: 8,
      height: 8,
      interpolation: img.Interpolation.average,
    );

    final luminance = <int>[];
    var sum = 0;
    for (var y = 0; y < 8; y++) {
      for (var x = 0; x < 8; x++) {
        final p = resized.getPixel(x, y);
        final value =
            ((p.r.toInt() * 299) + (p.g.toInt() * 587) + (p.b.toInt() * 114)) ~/
            1000;
        luminance.add(value);
        sum += value;
      }
    }

    final avg = sum / 64.0;
    var hash = 0;
    for (var i = 0; i < luminance.length; i++) {
      if (luminance[i] >= avg) {
        hash |= (1 << i);
      }
    }
    return hash.toRadixString(16).padLeft(16, '0');
  } catch (_) {
    return null;
  }
}

int _hammingDistance64(String aHex, String bHex) {
  var value = int.parse(aHex, radix: 16) ^ int.parse(bHex, radix: 16);
  var count = 0;
  while (value != 0) {
    value &= (value - 1);
    count++;
  }
  return count;
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
  'category': item.category,
  'group': item.group,
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
    category: payload['category'] as String?,
    group: payload['group'] as String?,
  );
}
