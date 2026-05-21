import 'dart:io';
import 'dart:isolate';
import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;

import '../models/file_item.dart';
import '../models/scan_result.dart';
import '../models/space_lens_snapshot.dart';

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

class _SpaceLensWorkerMessage {
  final String rootPath;
  final SendPort sendPort;

  const _SpaceLensWorkerMessage({
    required this.rootPath,
    required this.sendPort,
  });
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
        'broken_login_items': [
          '$home/Library/LaunchAgents',
          '/Library/LaunchAgents',
          '/Library/LaunchDaemons',
        ],
      };
    } else if (Platform.isLinux) {
      return {
        'user_cache': ['$home/.cache'],
        'user_logs': ['/var/log'],
        'language_files': ['/usr/share/locale'],
        'system_logs': ['/tmp'],
        'broken_login_items': [
          '$home/.config/autostart',
          '/etc/xdg/autostart',
          '$home/.config/systemd/user',
          '/etc/systemd/user',
          '/usr/lib/systemd/user',
        ],
      };
    } else if (Platform.isWindows) {
      final tmp = Platform.environment['TEMP'] ?? '';
      final local = Platform.environment['LOCALAPPDATA'] ?? '';
      final appData = Platform.environment['APPDATA'] ?? '';
      final programData =
          Platform.environment['ProgramData'] ?? r'C:\ProgramData';
      final windir = Platform.environment['WINDIR'] ?? r'C:\Windows';
      return {
        'user_cache': ['$local\\Temp'],
        'user_logs': [],
        'language_files': ['$windir\\System32'],
        'system_logs': [tmp],
        'broken_login_items': [
          '$appData\\Microsoft\\Windows\\Start Menu\\Programs\\Startup',
          '$programData\\Microsoft\\Windows\\Start Menu\\Programs\\Startup',
        ],
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

  Future<SpaceLensSnapshot> scanSpaceLensSnapshot(
    String rootPath, {
    int topFolderLimit = 30,
    ScanProgressCallback? onProgress,
  }) async {
    final payload = await _runScanPayloadTask(
      task: 'spaceLensSnapshot',
      args: {'rootPath': rootPath, 'topFolderLimit': topFolderLimit},
      onProgress: onProgress,
    );
    return _spaceLensSnapshotFromPayload(payload);
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
    } else if (task == 'spaceLensSnapshot') {
      payload = await _spaceLensSnapshotPayload(
        args['rootPath'] as String,
        args['topFolderLimit'] as int,
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

SpaceLensSnapshot _spaceLensSnapshotFromPayload(Map<String, dynamic> payload) {
  final rootPath = payload['rootPath'] as String;
  final topFolders = (payload['topFolders'] as List<dynamic>)
      .cast<Map<String, dynamic>>()
      .map(_fileItemFromPayload)
      .toList(growable: false);
  final rawItemsByPath = (payload['itemsByPath'] as Map<dynamic, dynamic>).map(
    (key, value) => MapEntry(key as String, value as List<dynamic>),
  );
  final itemsByPath = rawItemsByPath.map(
    (path, rawItems) => MapEntry(
      path,
      rawItems
          .cast<Map<String, dynamic>>()
          .map(_fileItemFromPayload)
          .toList(growable: false),
    ),
  );
  return SpaceLensSnapshot(
    rootPath: rootPath,
    topFolders: topFolders,
    itemsByPath: itemsByPath,
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

  if (Platform.isWindows && categories.containsKey('broken_login_items')) {
    await _collectBrokenWindowsRegistryLoginItemsPayload(items);
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

          onTick?.call(1, stat.size);

          if (categoryId == 'broken_login_items') {
            final brokenReason = await _findBrokenLoginItemReason(entity.path);
            if (brokenReason == null) {
              continue;
            }

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
                  group: brokenReason,
                ),
              ),
            });
            continue;
          }

          // Determine group: first path segment within the root dir.
          String? group;
          if (entity.path.startsWith(rootPrefix)) {
            final rest = entity.path.substring(rootPrefix.length);
            final firstSep = rest.indexOf(sep);
            group = firstSep == -1 ? rest : rest.substring(0, firstSep);
          }

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

Future<Map<String, dynamic>> _spaceLensSnapshotPayload(
  String rootPath,
  int topFolderLimit,
  void Function(ScanProgress progress) onProgress,
  bool Function() isCancelled,
) async {
  if (isCancelled()) throw const ScanCancelledException();
  onProgress(
    const ScanProgress(phase: ScanPhase.scanning, processed: 0, total: 1),
  );

  final emitter = _ProgressEmitter(emit: onProgress);
  int rootProcessedUnits = 0;
  int processedBytes = 0;
  int totalRootUnits = 0;
  final subtreeProcessedUnits = <String, int>{};
  final subtreeTotalUnits = <String, int>{};
  double lastEmittedFraction = 0;

  void emitSnapshotProgress() {
    final subtreeProcessedTotal = subtreeProcessedUnits.values.fold<int>(
      0,
      (sum, units) => sum + units,
    );
    final subtreeKnownTotal = subtreeTotalUnits.values.fold<int>(
      0,
      (sum, units) => sum + units,
    );
    final unknownSubtreeCount = subtreeProcessedUnits.keys
        .where((path) => !subtreeTotalUnits.containsKey(path))
        .length;
    final unknownSubtreeBudget = unknownSubtreeCount * 5000;
    var processedUnits = rootProcessedUnits + subtreeProcessedTotal;
    final totalUnits = math.max(
      processedUnits + 1,
      totalRootUnits + subtreeKnownTotal + unknownSubtreeBudget,
    );

    final nextFraction = totalUnits <= 0 ? 0.0 : processedUnits / totalUnits;
    if (nextFraction < lastEmittedFraction) {
      processedUnits = (lastEmittedFraction * totalUnits).ceil();
    } else {
      lastEmittedFraction = nextFraction;
    }

    if (processedUnits > totalUnits) {
      processedUnits = totalUnits;
    }

    emitter.push(
      ScanPhase.scanning,
      processedUnits,
      totalUnits,
      processedBytes: processedBytes,
    );
  }

  emitter.push(ScanPhase.scanning, 0, 1, force: true);

  final itemsByPath = <String, List<Map<String, dynamic>>>{};
  final rootChildren = <Map<String, dynamic>>[];
  final rootDir = Directory(rootPath);

  try {
    final subdirectories = <String>[];
    await for (final entity in rootDir.list(followLinks: false)) {
      if (isCancelled()) throw const ScanCancelledException();
      final path = entity.path;
      final name = _basename(path);
      if (name.startsWith('.')) {
        continue;
      }

      if (entity is Directory) {
        subdirectories.add(path);
        subtreeProcessedUnits[path] = 0;
        emitSnapshotProgress();
        continue;
      }

      if (entity is File) {
        try {
          totalRootUnits++;
          final stat = await entity.stat();
          rootProcessedUnits++;
          processedBytes += stat.size;
          emitSnapshotProgress();
          rootChildren.add(
            _fileItemToPayload(
              FileItem(
                path: path,
                name: name,
                sizeBytes: stat.size,
                modified: stat.modified,
                isDirectory: false,
              ),
            ),
          );
        } catch (_) {}
      }
    }

    final subtreePayloads = await _runSpaceLensSubtreesWithMaxConcurrency(
      subdirectories,
      maxConcurrent: 4,
      isCancelled: isCancelled,
      onSubtreeCounted: (path, totalUnits) {
        subtreeTotalUnits[path] = totalUnits;
        emitSnapshotProgress();
      },
      onSubtreeProgress: (path, processedUnits) {
        subtreeProcessedUnits[path] = processedUnits;
        emitSnapshotProgress();
      },
    );

    for (final subtree in subtreePayloads) {
      if (isCancelled()) throw const ScanCancelledException();

      final path = (subtree['rootItem'] as Map)['path'] as String;
      subtreeTotalUnits[path] = subtree['entityCount'] as int;
      subtreeProcessedUnits[path] = subtree['entityCount'] as int;

      rootChildren.add((subtree['rootItem'] as Map).cast<String, dynamic>());

      final subtreeItemsByPath = (subtree['itemsByPath'] as Map)
          .cast<String, dynamic>();
      for (final entry in subtreeItemsByPath.entries) {
        final value = (entry.value as List<dynamic>)
            .cast<Map<String, dynamic>>()
            .toList(growable: false);
        itemsByPath[entry.key] = value;
      }

      processedBytes += subtree['totalBytes'] as int;
      emitSnapshotProgress();
    }
  } on ScanCancelledException {
    rethrow;
  } catch (_) {}

  rootChildren.sort((a, b) {
    final aIsDir = a['isDirectory'] as bool;
    final bIsDir = b['isDirectory'] as bool;
    if (aIsDir != bIsDir) {
      return aIsDir ? -1 : 1;
    }
    final aName = (a['name'] as String).toLowerCase();
    final bName = (b['name'] as String).toLowerCase();
    return aName.compareTo(bName);
  });
  itemsByPath[rootPath] = rootChildren;

  emitter.push(
    ScanPhase.scanning,
    math.max(
      1,
      totalRootUnits + subtreeTotalUnits.values.fold<int>(0, (s, v) => s + v),
    ),
    math.max(
      1,
      totalRootUnits + subtreeTotalUnits.values.fold<int>(0, (s, v) => s + v),
    ),
    processedBytes: processedBytes,
    force: true,
  );

  final topFolders =
      rootChildren
          .where((item) => item['isDirectory'] == true)
          .toList(growable: false)
        ..sort(
          (a, b) => (b['sizeBytes'] as int).compareTo(a['sizeBytes'] as int),
        );

  return {
    'rootPath': rootPath,
    'topFolders': topFolders.take(topFolderLimit).toList(growable: false),
    'itemsByPath': itemsByPath,
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

Future<List<Map<String, dynamic>>> _runSpaceLensSubtreesWithMaxConcurrency(
  List<String> subdirectories, {
  required int maxConcurrent,
  required bool Function() isCancelled,
  required void Function(String path, int totalUnits) onSubtreeCounted,
  required void Function(String path, int processedUnits) onSubtreeProgress,
}) async {
  if (subdirectories.isEmpty) return <Map<String, dynamic>>[];

  final results = List<Map<String, dynamic>?>.filled(
    subdirectories.length,
    null,
  );
  final activeWorkers = <Isolate>{};
  var nextIndex = 0;

  void killActiveWorkers() {
    for (final worker in activeWorkers.toList(growable: false)) {
      worker.kill(priority: Isolate.immediate);
    }
    activeWorkers.clear();
  }

  Future<void> runner() async {
    while (true) {
      if (isCancelled()) {
        killActiveWorkers();
        throw const ScanCancelledException();
      }

      if (nextIndex >= subdirectories.length) {
        return;
      }

      final index = nextIndex;
      nextIndex++;

      results[index] = await _awaitFutureWithCancellation(
        _runSpaceLensSubtreeInIsolate(
          subdirectories[index],
          onSpawned: (worker) => activeWorkers.add(worker),
          onDisposed: (worker) => activeWorkers.remove(worker),
          onCounted: (totalUnits) {
            onSubtreeCounted(subdirectories[index], totalUnits);
          },
          onProgress: (processedUnits) {
            onSubtreeProgress(subdirectories[index], processedUnits);
          },
        ),
        isCancelled: isCancelled,
        onCancel: killActiveWorkers,
      );
    }
  }

  final runnerCount = math.min(maxConcurrent, subdirectories.length);
  try {
    await Future.wait(
      List<Future<void>>.generate(runnerCount, (_) => runner()),
    );
    return results.cast<Map<String, dynamic>>();
  } on ScanCancelledException {
    killActiveWorkers();
    rethrow;
  } catch (_) {
    killActiveWorkers();
    rethrow;
  }
}

Future<T> _awaitFutureWithCancellation<T>(
  Future<T> future, {
  required bool Function() isCancelled,
  required void Function() onCancel,
}) async {
  var isDone = false;
  Object? caughtError;
  StackTrace? caughtStack;
  T? value;

  future.then(
    (result) {
      isDone = true;
      value = result;
    },
    onError: (Object error, StackTrace stack) {
      isDone = true;
      caughtError = error;
      caughtStack = stack;
    },
  );

  while (!isDone) {
    if (isCancelled()) {
      onCancel();
      throw const ScanCancelledException();
    }
    await Future<void>.delayed(const Duration(milliseconds: 80));
  }

  if (caughtError != null) {
    Error.throwWithStackTrace(caughtError!, caughtStack ?? StackTrace.current);
  }
  return value as T;
}

Future<Map<String, dynamic>> _runSpaceLensSubtreeInIsolate(
  String rootPath, {
  required void Function(Isolate worker) onSpawned,
  required void Function(Isolate worker) onDisposed,
  required void Function(int totalUnits) onCounted,
  required void Function(int processedUnits) onProgress,
}) async {
  final receivePort = ReceivePort();
  final errorPort = ReceivePort();
  final completer = Completer<Map<String, dynamic>>();
  StreamSubscription<dynamic>? resultSub;
  StreamSubscription<dynamic>? errorSub;

  final worker = await Isolate.spawn<_SpaceLensWorkerMessage>(
    _spaceLensSubtreeIsolateEntry,
    _SpaceLensWorkerMessage(rootPath: rootPath, sendPort: receivePort.sendPort),
    onError: errorPort.sendPort,
    errorsAreFatal: true,
  );
  onSpawned(worker);

  resultSub = receivePort.listen((dynamic message) {
    if (completer.isCompleted) return;
    if (message is! Map) return;

    final type = message['type'] as String?;
    if (type == 'counted') {
      onCounted(message['total'] as int? ?? 0);
      return;
    }
    if (type == 'progress') {
      onProgress(message['processed'] as int? ?? 0);
      return;
    }
    if (type == 'result') {
      completer.complete((message['payload'] as Map).cast<String, dynamic>());
      return;
    }

    completer.completeError(
      Exception((message['message'] as String?) ?? 'Subtree worker failed'),
    );
  });

  errorSub = errorPort.listen((dynamic message) {
    if (!completer.isCompleted) {
      completer.completeError(Exception('Subtree isolate error: $message'));
    }
  });

  try {
    return await completer.future;
  } finally {
    await resultSub.cancel();
    await errorSub.cancel();
    receivePort.close();
    errorPort.close();
    onDisposed(worker);
    worker.kill(priority: Isolate.immediate);
  }
}

void _spaceLensSubtreeIsolateEntry(_SpaceLensWorkerMessage message) async {
  try {
    final totalUnits = await _countSpaceLensSubtreeEntities(message.rootPath);
    message.sendPort.send({'type': 'counted', 'total': totalUnits});

    var lastReported = DateTime.fromMillisecondsSinceEpoch(0);
    var lastProcessed = 0;

    void emitWorkerProgress(int processedUnits, {bool force = false}) {
      final now = DateTime.now();
      final elapsed = now.difference(lastReported);
      final changedEnough = processedUnits - lastProcessed >= 50;
      if (!force &&
          !changedEnough &&
          elapsed < const Duration(milliseconds: 120)) {
        return;
      }
      lastProcessed = processedUnits;
      lastReported = now;
      message.sendPort.send({'type': 'progress', 'processed': processedUnits});
    }

    final payload = await _spaceLensSubtreePayloadEntry(
      message.rootPath,
      onProgress: emitWorkerProgress,
    );
    emitWorkerProgress(payload['entityCount'] as int, force: true);
    message.sendPort.send({'type': 'result', 'payload': payload});
  } catch (e) {
    message.sendPort.send({'type': 'error', 'message': e.toString()});
  }
}

Future<Map<String, dynamic>> _spaceLensSubtreePayloadEntry(
  String rootPath, {
  void Function(int processedUnits)? onProgress,
}) async {
  final itemsByPath = <String, List<Map<String, dynamic>>>{};
  var processedUnits = 0;
  final summary = await _buildSpaceLensSubtreeSummary(
    rootPath,
    itemsByPath,
    onEntityScanned: () {
      processedUnits++;
      onProgress?.call(processedUnits);
    },
  );
  return {
    'rootItem': summary.itemPayload,
    'itemsByPath': itemsByPath,
    'totalBytes': summary.totalBytes,
    'entityCount': summary.entityCount,
  };
}

Future<int> _countSpaceLensSubtreeEntities(String dirPath) async {
  int total = 1;
  try {
    await for (final entity in Directory(dirPath).list(followLinks: false)) {
      final name = _basename(entity.path);
      if (name.startsWith('.')) {
        continue;
      }
      if (entity is Directory) {
        total += await _countSpaceLensSubtreeEntities(entity.path);
        continue;
      }
      if (entity is File) {
        total++;
      }
    }
  } catch (_) {}
  return total;
}

Future<_SpaceLensSubtreeSummary> _buildSpaceLensSubtreeSummary(
  String dirPath,
  Map<String, List<Map<String, dynamic>>> itemsByPath, {
  void Function()? onEntityScanned,
}) async {
  final children = <Map<String, dynamic>>[];
  int totalBytes = 0;
  int entityCount = 1;
  onEntityScanned?.call();

  try {
    await for (final entity in Directory(dirPath).list(followLinks: false)) {
      final path = entity.path;
      final name = _basename(path);
      if (name.startsWith('.')) {
        continue;
      }

      if (entity is Directory) {
        final summary = await _buildSpaceLensSubtreeSummary(
          path,
          itemsByPath,
          onEntityScanned: onEntityScanned,
        );
        totalBytes += summary.totalBytes;
        entityCount += summary.entityCount;
        children.add(summary.itemPayload);
        continue;
      }

      if (entity is File) {
        try {
          final stat = await entity.stat();
          onEntityScanned?.call();
          totalBytes += stat.size;
          entityCount++;
          children.add(
            _fileItemToPayload(
              FileItem(
                path: path,
                name: name,
                sizeBytes: stat.size,
                modified: stat.modified,
                isDirectory: false,
              ),
            ),
          );
        } catch (_) {}
      }
    }
  } catch (_) {}

  children.sort((a, b) {
    final aIsDir = a['isDirectory'] as bool;
    final bIsDir = b['isDirectory'] as bool;
    if (aIsDir != bIsDir) {
      return aIsDir ? -1 : 1;
    }
    final aName = (a['name'] as String).toLowerCase();
    final bName = (b['name'] as String).toLowerCase();
    return aName.compareTo(bName);
  });
  itemsByPath[dirPath] = children;

  DateTime modified = DateTime.fromMillisecondsSinceEpoch(0);
  try {
    modified = (await Directory(dirPath).stat()).modified;
  } catch (_) {}

  return _SpaceLensSubtreeSummary(
    itemPayload: _fileItemToPayload(
      FileItem(
        path: dirPath,
        name: _basename(dirPath),
        sizeBytes: totalBytes,
        modified: modified,
        isDirectory: true,
      ),
    ),
    totalBytes: totalBytes,
    entityCount: entityCount,
  );
}

class _SpaceLensSubtreeSummary {
  final Map<String, dynamic> itemPayload;
  final int totalBytes;
  final int entityCount;

  const _SpaceLensSubtreeSummary({
    required this.itemPayload,
    required this.totalBytes,
    required this.entityCount,
  });
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
  } on ScanCancelledException {
    rethrow;
  } catch (_) {}
  return total;
}

Future<String?> _findBrokenMacLoginItemReason(String plistPath) async {
  if (!plistPath.toLowerCase().endsWith('.plist')) {
    return null;
  }

  String content;
  try {
    content = await File(plistPath).readAsString();
  } catch (_) {
    return 'Unreadable launch item plist';
  }

  final program = _plistStringValue(content, 'Program');
  final programArg0 = _plistArrayFirstValue(content, 'ProgramArguments');
  final command = (program ?? programArg0)?.trim();
  if (command == null || command.isEmpty) {
    return 'Missing Program or ProgramArguments';
  }

  final exists = await _macCommandExists(command);
  if (!exists) {
    return 'Missing executable target';
  }

  return null;
}

Future<String?> _findBrokenLoginItemReason(String path) async {
  if (Platform.isMacOS) {
    return _findBrokenMacLoginItemReason(path);
  }
  if (Platform.isLinux) {
    return _findBrokenLinuxLoginItemReason(path);
  }
  if (Platform.isWindows) {
    return _findBrokenWindowsStartupFileReason(path);
  }
  return null;
}

Future<String?> _findBrokenLinuxLoginItemReason(String path) async {
  final lower = path.toLowerCase();
  if (lower.endsWith('.desktop')) {
    String content;
    try {
      content = await File(path).readAsString();
    } catch (_) {
      return 'Unreadable desktop entry';
    }

    final tryExec = _iniKeyValue(content, 'TryExec');
    if (tryExec != null && tryExec.trim().isNotEmpty) {
      final tryExecCommand = _stripLinuxCommandPrefixes(tryExec.trim());
      if (!await _linuxCommandExists(tryExecCommand)) {
        return 'Missing TryExec target';
      }
    }

    final exec = _iniKeyValue(content, 'Exec');
    if (exec == null || exec.trim().isEmpty) {
      return 'Missing Exec target';
    }

    final normalizedExec = _stripLinuxCommandPrefixes(
      _removeDesktopExecFieldCodes(exec.trim()),
    );
    if (!await _linuxCommandExists(normalizedExec)) {
      return 'Missing executable target';
    }
    return null;
  }

  if (lower.endsWith('.service')) {
    String content;
    try {
      content = await File(path).readAsString();
    } catch (_) {
      return 'Unreadable systemd service file';
    }

    final execStart = _iniKeyValue(content, 'ExecStart');
    if (execStart == null || execStart.trim().isEmpty) {
      return 'Missing ExecStart target';
    }

    var command = execStart.trim();
    if (command.startsWith('-')) {
      command = command.substring(1).trim();
    }
    if (command.startsWith('@')) {
      command = command.substring(1).trim();
    }

    command = _stripLinuxCommandPrefixes(command);
    if (!await _linuxCommandExists(command)) {
      return 'Missing executable target';
    }
    return null;
  }

  return null;
}

Future<String?> _findBrokenWindowsStartupFileReason(String path) async {
  final lower = path.toLowerCase();
  if (lower.endsWith('.lnk')) {
    try {
      final stat = await File(path).stat();
      if (stat.size == 0) {
        return 'Invalid shortcut file';
      }
    } catch (_) {
      return 'Unreadable shortcut file';
    }
  }
  return null;
}

Future<void> _collectBrokenWindowsRegistryLoginItemsPayload(
  List<Map<String, dynamic>> out,
) async {
  if (!Platform.isWindows) return;

  const runKeys = [
    r'HKCU\Software\Microsoft\Windows\CurrentVersion\Run',
    r'HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce',
    r'HKLM\Software\Microsoft\Windows\CurrentVersion\Run',
    r'HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce',
    r'HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Run',
  ];

  final now = DateTime.now();
  for (final key in runKeys) {
    try {
      final result = await Process.run('reg', ['query', key]);
      if (result.exitCode != 0) continue;

      final lines = (result.stdout as String).split(RegExp(r'\r?\n'));
      for (final line in lines) {
        final trimmed = line.trim();
        if (trimmed.isEmpty || trimmed.startsWith('HKEY_')) continue;

        final cols = trimmed.split(RegExp(r'\s{2,}'));
        if (cols.length < 3) continue;

        final valueName = cols[0].trim();
        final valueType = cols[1].trim().toUpperCase();
        final valueData = cols.sublist(2).join(' ').trim();
        if (valueData.isEmpty) continue;
        if (valueType != 'REG_SZ' && valueType != 'REG_EXPAND_SZ') continue;

        final reason = await _findBrokenWindowsCommandReason(valueData);
        if (reason == null) continue;

        out.add({
          ..._fileItemToPayload(
            FileItem(
              path: 'Registry: $key\\$valueName',
              name: '$valueName ($key)',
              sizeBytes: 0,
              modified: now,
              isDirectory: false,
              isSelected: true,
              category: 'broken_login_items',
              group: reason,
            ),
          ),
        });
      }
    } catch (_) {}
  }
}

Future<String?> _findBrokenWindowsCommandReason(String rawCommand) async {
  final expanded = _expandWindowsEnvVars(rawCommand.trim());
  final executable = _extractExecutableToken(expanded);
  if (executable == null || executable.isEmpty) {
    return 'Missing command target';
  }

  final exists = await _windowsCommandExists(executable);
  if (!exists) {
    return 'Missing executable target';
  }
  return null;
}

String? _iniKeyValue(String content, String key) {
  final match = RegExp(
    '^\\s*${RegExp.escape(key)}\\s*=\\s*(.+)\$',
    multiLine: true,
    caseSensitive: false,
  ).firstMatch(content);
  return match?.group(1)?.trim();
}

String _removeDesktopExecFieldCodes(String value) {
  return value.replaceAll(RegExp(r'%[fFuUdDnNickvm]'), '').trim();
}

String _stripLinuxCommandPrefixes(String command) {
  var work = command.trim();
  if (work.startsWith('/usr/bin/env ')) {
    work = work.substring('/usr/bin/env '.length).trim();
  }

  while (true) {
    final token = _extractExecutableToken(work);
    if (token == null) return work;
    final isEnvAssignment = RegExp(r'^[A-Za-z_][A-Za-z0-9_]*=').hasMatch(token);
    if (!isEnvAssignment) return work;

    final idx = work.indexOf(token);
    if (idx == -1) return work;
    work = work.substring(idx + token.length).trimLeft();
  }
}

String? _extractExecutableToken(String rawCommand) {
  final s = rawCommand.trim();
  if (s.isEmpty) return null;
  if (s.startsWith('"')) {
    final end = s.indexOf('"', 1);
    if (end > 1) return s.substring(1, end).trim();
  }

  final match = RegExp(r'^([^\s]+)').firstMatch(s);
  return match?.group(1)?.trim();
}

Future<bool> _linuxCommandExists(String rawCommand) async {
  final token = _extractExecutableToken(rawCommand);
  if (token == null || token.isEmpty) return false;

  if (token.startsWith('/')) {
    return await File(token).exists() || await Directory(token).exists();
  }

  if (token.contains('/')) {
    return await File(token).exists() || await Directory(token).exists();
  }

  final candidates = <String>{};
  final pathEnv = Platform.environment['PATH'] ?? '';
  for (final part in pathEnv.split(':')) {
    final dir = part.trim();
    if (dir.isNotEmpty) candidates.add(dir);
  }
  candidates.addAll(const ['/usr/bin', '/bin', '/usr/sbin', '/sbin']);

  for (final dir in candidates) {
    final fullPath = '$dir/$token';
    if (await File(fullPath).exists()) {
      return true;
    }
  }
  return false;
}

String _expandWindowsEnvVars(String value) {
  return value.replaceAllMapped(RegExp(r'%([^%]+)%'), (match) {
    final key = match.group(1) ?? '';
    return Platform.environment[key] ?? match.group(0)!;
  });
}

Future<bool> _windowsCommandExists(String commandToken) async {
  final token = commandToken.replaceAll('"', '').trim();
  if (token.isEmpty) return false;

  final pathExtRaw = Platform.environment['PATHEXT'] ?? '.EXE;.CMD;.BAT;.COM';
  final pathExt = pathExtRaw
      .split(';')
      .map((e) => e.trim().toLowerCase())
      .where((e) => e.isNotEmpty)
      .toList(growable: false);

  final hasExt =
      token.contains('.') && RegExp(r'\.[a-zA-Z0-9]+$').hasMatch(token);

  final isAbsolute =
      RegExp(r'^[a-zA-Z]:[\\/]').hasMatch(token) || token.startsWith('\\\\');
  final hasSeparator = token.contains('\\') || token.contains('/');

  Future<bool> fileExistsWithPathext(String basePath) async {
    if (await File(basePath).exists() || await Directory(basePath).exists()) {
      return true;
    }
    if (hasExt) return false;
    for (final ext in pathExt) {
      if (await File('$basePath$ext').exists()) {
        return true;
      }
    }
    return false;
  }

  if (isAbsolute || hasSeparator) {
    return fileExistsWithPathext(token);
  }

  final searchDirs = <String>{};
  final pathEnv = Platform.environment['PATH'] ?? '';
  for (final part in pathEnv.split(';')) {
    final dir = part.trim();
    if (dir.isNotEmpty) searchDirs.add(dir);
  }

  final windir = Platform.environment['WINDIR'] ?? r'C:\Windows';
  searchDirs.add('$windir\\System32');
  searchDirs.add(windir);

  for (final dir in searchDirs) {
    final basePath = '$dir\\$token';
    if (await fileExistsWithPathext(basePath)) {
      return true;
    }
  }
  return false;
}

String? _plistStringValue(String plistXml, String key) {
  final match = RegExp(
    '<key>\\s*${RegExp.escape(key)}\\s*</key>\\s*<string>([^<]+)</string>',
    caseSensitive: false,
    dotAll: true,
  ).firstMatch(plistXml);
  return match?.group(1)?.trim();
}

String? _plistArrayFirstValue(String plistXml, String key) {
  final arrayMatch = RegExp(
    '<key>\\s*${RegExp.escape(key)}\\s*</key>\\s*<array>(.*?)</array>',
    caseSensitive: false,
    dotAll: true,
  ).firstMatch(plistXml);
  final arrayBody = arrayMatch?.group(1);
  if (arrayBody == null) return null;

  final firstStringMatch = RegExp(
    '<string>([^<]+)</string>',
    caseSensitive: false,
    dotAll: true,
  ).firstMatch(arrayBody);
  return firstStringMatch?.group(1)?.trim();
}

Future<bool> _macCommandExists(String command) async {
  if (command.startsWith('/')) {
    return await File(command).exists() || await Directory(command).exists();
  }

  final candidates = <String>{};
  final pathEnv = Platform.environment['PATH'] ?? '';
  for (final part in pathEnv.split(':')) {
    if (part.trim().isNotEmpty) {
      candidates.add(part.trim());
    }
  }

  candidates.addAll(const [
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin',
    '/usr/local/bin',
    '/opt/homebrew/bin',
  ]);

  for (final dir in candidates) {
    final fullPath = '$dir/$command';
    if (await File(fullPath).exists()) {
      return true;
    }
  }
  return false;
}

Future<String?> _resolveApplicationIconPath(String appPath) async {
  if (!Platform.isMacOS || !appPath.endsWith('.app')) return null;
  final resourcesDir = Directory('$appPath/Contents/Resources');
  if (!await resourcesDir.exists()) return null;

  final candidates = <String>{'AppIcon', 'icon'};
  final infoPlist = File('$appPath/Contents/Info.plist');
  final plistContent = await _readMacOsPlistXml(infoPlist.path);
  if (plistContent != null) {
    try {
      final iconFileMatch = RegExp(
        r'<key>\s*CFBundleIconFile\s*</key>\s*<string>([^<]+)</string>',
      ).firstMatch(plistContent);
      final iconNameMatch = RegExp(
        r'<key>\s*CFBundleIconName\s*</key>\s*<string>([^<]+)</string>',
      ).firstMatch(plistContent);
      final iconFile = iconFileMatch?.group(1)?.trim();
      final iconName = iconNameMatch?.group(1)?.trim();
      if (iconFile != null && iconFile.isNotEmpty) {
        candidates.add(_stripFileExtension(iconFile));
      }
      if (iconName != null && iconName.isNotEmpty) {
        candidates.add(_stripFileExtension(iconName));
      }
    } catch (_) {}
  }

  for (final base in candidates) {
    final resolved = await _resolveApplicationIconCandidate(
      resourcesDir.path,
      base,
    );
    if (resolved != null) return resolved;
  }

  try {
    await for (final entity in resourcesDir.list(followLinks: false)) {
      if (entity is! File) continue;
      final name = _basename(entity.path).toLowerCase();
      final isImage = _supportedApplicationIconExtensions.any(
        (ext) => name.endsWith(ext),
      );
      if (!isImage) continue;
      if (!name.contains('icon') && !name.contains('app')) continue;
      if (name.endsWith('.icns')) {
        return _materializeMacOsIcnsPreview(entity.path);
      }
      return entity.path;
    }
  } catch (_) {}

  return null;
}

const _supportedApplicationIconExtensions = [
  '.png',
  '.jpg',
  '.jpeg',
  '.webp',
  '.icns',
];

Future<String?> _resolveApplicationIconCandidate(
  String resourcesDir,
  String baseName,
) async {
  final normalizedBase = _stripFileExtension(baseName);
  for (final ext in _supportedApplicationIconExtensions) {
    final sourcePath = '$resourcesDir/$normalizedBase$ext';
    if (!await File(sourcePath).exists()) continue;
    if (ext == '.icns') {
      return _materializeMacOsIcnsPreview(sourcePath);
    }
    return sourcePath;
  }
  return null;
}

Future<String?> _readMacOsPlistXml(String plistPath) async {
  final plistFile = File(plistPath);
  if (!await plistFile.exists()) return null;

  try {
    final result = await Process.run('plutil', [
      '-convert',
      'xml1',
      '-o',
      '-',
      plistPath,
    ]);
    if (result.exitCode == 0 && result.stdout is String) {
      final output = (result.stdout as String).trim();
      if (output.isNotEmpty) return output;
    }
  } catch (_) {}

  try {
    return await plistFile.readAsString();
  } catch (_) {
    return null;
  }
}

Future<String?> _materializeMacOsIcnsPreview(String sourcePath) async {
  final sourceFile = File(sourcePath);
  if (!await sourceFile.exists()) return null;

  try {
    final stat = await sourceFile.stat();
    final signature = [
      sourcePath,
      stat.modified.millisecondsSinceEpoch.toString(),
      stat.size.toString(),
    ].join(':');
    final cacheDir = Directory(
      '${Directory.systemTemp.path}${Platform.pathSeparator}pristine_cleaner_app_icons',
    );
    if (!await cacheDir.exists()) {
      await cacheDir.create(recursive: true);
    }

    final outputPath =
        '${cacheDir.path}${Platform.pathSeparator}${_stablePathId(signature)}.png';
    final outputFile = File(outputPath);
    if (await outputFile.exists()) return outputPath;

    final sipsResult = await Process.run('sips', [
      '-s',
      'format',
      'png',
      sourcePath,
      '--out',
      outputPath,
    ]);
    if (sipsResult.exitCode == 0 && await outputFile.exists()) {
      return outputPath;
    }

    final bytes = await sourceFile.readAsBytes();
    final decoded = img.decodeImage(bytes);
    if (decoded == null) return null;
    await outputFile.writeAsBytes(img.encodePng(decoded), flush: true);
    return outputPath;
  } catch (_) {
    return null;
  }
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

String _stripFileExtension(String value) {
  final normalized = value.trim();
  for (final ext in _supportedApplicationIconExtensions) {
    if (normalized.toLowerCase().endsWith(ext)) {
      return normalized.substring(0, normalized.length - ext.length);
    }
  }
  return normalized;
}

String _stablePathId(String input) {
  const offset = 0xcbf29ce484222325;
  const prime = 0x100000001b3;
  const mask64 = 0xFFFFFFFFFFFFFFFF;
  var hash = offset;
  for (final unit in input.codeUnits) {
    hash ^= unit;
    hash = (hash * prime) & mask64;
  }
  return hash.toRadixString(16).padLeft(16, '0');
}

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
