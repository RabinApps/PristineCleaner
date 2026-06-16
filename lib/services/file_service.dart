import 'dart:io';
import 'dart:isolate';
import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:system_info2/system_info2.dart';

import '../core/models/file_item.dart';
import '../core/models/scan_result.dart';
import '../core/models/space_view_snapshot.dart';
import '../gen/strings.g.dart';
import 'scan_manager.dart';

part 'applications_service.dart';
part 'cleanup_service.dart';
part 'duplicates_service.dart';
part 'images_service.dart';
part 'space_view_service.dart';

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
  String toString() => t.myToolsMessages.scanCancelled;
}

class _ActiveScanTask {
  final Completer<Map<String, dynamic>> completer;
  Isolate? isolate;
  SendPort? controlPort;

  _ActiveScanTask({required this.completer});
}

class FileService {
  final Map<int, _ActiveScanTask> _activeScanTasks = {};
  final ApplicationsService _applicationsService;
  final CleanupService _cleanupService;
  final DuplicatesService _duplicatesService;
  final ImagesService _imagesService;
  final SpaceViewService _spaceViewService;
  int _nextScanTaskId = 0;

  FileService({
    ApplicationsService? applicationsService,
    CleanupService? cleanupService,
    DuplicatesService? duplicatesService,
    ImagesService? imagesService,
    SpaceViewService? spaceViewService,
  }) : _applicationsService =
           applicationsService ?? const ApplicationsService(),
       _cleanupService = cleanupService ?? const CleanupService(),
       _duplicatesService = duplicatesService ?? const DuplicatesService(),
       _imagesService = imagesService ?? const ImagesService(),
       _spaceViewService = spaceViewService ?? const SpaceViewService();

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

  Future<SystemUsage> getSystemUsage() async {
    try {
      final cpuPercent = await _getCpuUsagePercent();
      final memory = _getMemoryUsage();
      return SystemUsage(
        cpuPercent: cpuPercent,
        totalMemoryBytes: memory.totalMemoryBytes,
        usedMemoryBytes: memory.usedMemoryBytes,
      );
    } catch (_) {
      // Fall through and return unavailable metrics.
    }
    return const SystemUsage.unavailable();
  }

  Future<double> _getCpuUsagePercent() async {
    if (Platform.isMacOS) {
      return _getMacCpuUsagePercent();
    }
    if (Platform.isLinux) {
      return _getLinuxCpuUsagePercent();
    }
    if (Platform.isWindows) {
      return _getWindowsCpuUsagePercent();
    }
    return 0;
  }

  _MemoryUsage _getMemoryUsage() {
    if (Platform.isMacOS) {
      return _getMacMemoryUsage();
    }

    final total = SysInfo.getTotalPhysicalMemory();
    final available = SysInfo.getAvailablePhysicalMemory();
    return _memoryUsageFromTotalAvailable(total, available);
  }

  _MemoryUsage _getMacMemoryUsage() {
    try {
      final totalResult = Process.runSync('sysctl', ['-n', 'hw.memsize']);
      final total = int.tryParse((totalResult.stdout as String).trim()) ?? 0;

      final vmStatResult = Process.runSync('vm_stat', const []);
      final vmOutput = vmStatResult.stdout as String;
      final pageSize = _extractMacPageSize(vmOutput);

      // Count reclaimable memory as available for a more realistic "used" view.
      final availablePages =
          _extractVmStatPages(vmOutput, 'Pages free') +
          _extractVmStatPages(vmOutput, 'Pages speculative') +
          _extractVmStatPages(vmOutput, 'Pages inactive');
      final available = availablePages * pageSize;

      return _memoryUsageFromTotalAvailable(total, available);
    } catch (_) {
      return const _MemoryUsage(totalMemoryBytes: 0, usedMemoryBytes: 0);
    }
  }

  _MemoryUsage _memoryUsageFromTotalAvailable(int total, int available) {
    if (total <= 0) {
      return const _MemoryUsage(totalMemoryBytes: 0, usedMemoryBytes: 0);
    }

    final safeAvailable = available.clamp(0, total);
    final used = (total - safeAvailable).clamp(0, total);
    return _MemoryUsage(totalMemoryBytes: total, usedMemoryBytes: used);
  }

  int _extractMacPageSize(String vmOutput) {
    final match = RegExp(r'page size of (\d+) bytes').firstMatch(vmOutput);
    return int.tryParse(match?.group(1) ?? '') ?? 4096;
  }

  int _extractVmStatPages(String vmOutput, String key) {
    final escaped = RegExp.escape(key);
    final match = RegExp('$escaped:\\s+(\\d+)\\.').firstMatch(vmOutput);
    return int.tryParse(match?.group(1) ?? '') ?? 0;
  }

  Future<double> _getMacCpuUsagePercent() async {
    final cpuResult = await Process.run('sh', [
      '-c',
      "ps -A -o %cpu= | awk '{s+=\$1} END {print s}'",
    ]);
    final cores = SysInfo.cores.isNotEmpty
        ? SysInfo.cores.length
        : Platform.numberOfProcessors.clamp(1, 256);
    final totalCpu = double.tryParse((cpuResult.stdout as String).trim()) ?? 0;
    return (totalCpu / cores).clamp(0.0, 100.0);
  }

  Future<double> _getLinuxCpuUsagePercent() async {
    final first = await _readLinuxCpuSample();
    await Future<void>.delayed(const Duration(milliseconds: 250));
    final second = await _readLinuxCpuSample();

    final idleDelta = second.idle - first.idle;
    final totalDelta = second.total - first.total;
    return totalDelta <= 0
        ? 0.0
        : ((1 - (idleDelta / totalDelta)) * 100).clamp(0.0, 100.0);
  }

  Future<double> _getWindowsCpuUsagePercent() async {
    final result = await Process.run('powershell', [
      '-NoProfile',
      '-Command',
      r"(Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average).Average",
    ]);

    if (result.exitCode != 0) {
      return 0;
    }
    final value = double.tryParse((result.stdout as String).trim()) ?? 0;
    return value.clamp(0.0, 100.0);
  }

  Future<_LinuxCpuSample> _readLinuxCpuSample() async {
    final text = await File('/proc/stat').readAsString();
    final firstLine = text
        .split('\n')
        .firstWhere(
          (line) => line.startsWith('cpu '),
          orElse: () => 'cpu 0 0 0 0 0 0 0 0',
        );
    final values = firstLine
        .trim()
        .split(RegExp(r'\s+'))
        .skip(1)
        .map((v) => int.tryParse(v) ?? 0)
        .toList(growable: false);

    final idle = values.length > 3 ? values[3] : 0;
    final iowait = values.length > 4 ? values[4] : 0;
    final total = values.fold<int>(0, (sum, value) => sum + value);
    return _LinuxCpuSample(idle: idle + iowait, total: total);
  }

  // ─── Cleanup (cache / temp) ───────────────────────────────────────────────

  Future<ScanResult> scanCleanup({ScanProgressCallback? onProgress}) async {
    return _cleanupService.scanCleanup(this, onProgress: onProgress);
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
    return _duplicatesService.scanFreshDuplicates(
      this,
      rootPath,
      freshWindow: freshWindow,
      onProgress: onProgress,
    );
  }

  // ─── Large Similar Images ────────────────────────────────────────────────

  Future<ScanResult> scanLargeSimilarImages(
    String rootPath, {
    int minSizeBytes = 5 * 1024 * 1024,
    int maxHammingDistance = 8,
    ScanProgressCallback? onProgress,
  }) async {
    return _imagesService.scanLargeSimilarImages(
      this,
      rootPath,
      minSizeBytes: minSizeBytes,
      maxHammingDistance: maxHammingDistance,
      onProgress: onProgress,
    );
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

  // ─── Top Folders (Space View) ─────────────────────────────────────────────

  Future<List<FileItem>> getTopFolders(
    String rootPath, {
    int limit = 25,
    ScanProgressCallback? onProgress,
  }) async {
    return _spaceViewService.getTopFolders(
      this,
      rootPath,
      limit: limit,
      onProgress: onProgress,
    );
  }

  Future<SpaceViewSnapshot> scanSpaceViewSnapshot(
    String rootPath, {
    int topFolderLimit = 30,
    ScanProgressCallback? onProgress,
  }) async {
    return _spaceViewService.scanSpaceViewSnapshot(
      this,
      rootPath,
      topFolderLimit: topFolderLimit,
      onProgress: onProgress,
    );
  }

  // ─── Directory Browser ─────────────────────────────────────────────────────

  Future<List<FileItem>> listDirectoryContents(
    String dirPath, {
    bool includeHidden = false,
    int maxItems = 500,
  }) async {
    return _spaceViewService.listDirectoryContents(
      this,
      dirPath,
      includeHidden: includeHidden,
      maxItems: maxItems,
    );
  }

  // ─── Applications ─────────────────────────────────────────────────────────

  Future<ScanResult> scanApplications({
    ScanProgressCallback? onProgress,
  }) async {
    return _applicationsService.scanApplications(this, onProgress: onProgress);
  }

  Future<ScanResult> scanAppLeftovers({
    ScanProgressCallback? onProgress,
  }) async {
    return _applicationsService.scanAppLeftovers(this, onProgress: onProgress);
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
    // Register this background scan with the global ScanManager so UI and
    // exit-interceptor know a scan is active.
    try {
      ScanManager.instance.registerScan('file_scan_$taskId');
    } catch (_) {}

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
      // Ensure the scan manager is notified the scan finished.
      try {
        ScanManager.instance.unregisterScan('file_scan_$taskId');
      } catch (_) {}
    }
  }
}

class _LinuxCpuSample {
  final int idle;
  final int total;

  const _LinuxCpuSample({required this.idle, required this.total});
}

class _MemoryUsage {
  final int totalMemoryBytes;
  final int usedMemoryBytes;

  const _MemoryUsage({
    required this.totalMemoryBytes,
    required this.usedMemoryBytes,
  });
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
    } else if (task == 'spaceViewSnapshot') {
      payload = await _spaceViewSnapshotPayload(
        args['rootPath'] as String,
        args['topFolderLimit'] as int,
        emitProgress,
        () => cancelled,
      );
    } else if (task == 'scanApplications') {
      payload = await _scanApplicationsPayload(emitProgress, () => cancelled);
    } else if (task == 'scanAppLeftovers') {
      payload = await _scanAppLeftoversPayload(emitProgress, () => cancelled);
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

SpaceViewSnapshot _spaceViewSnapshotFromPayload(Map<String, dynamic> payload) {
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
  return SpaceViewSnapshot(
    rootPath: rootPath,
    topFolders: topFolders,
    itemsByPath: itemsByPath,
  );
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

String _basename(String path) => path.split(Platform.pathSeparator).last;

/// Test-only access to the library-private path basename helper.
@visibleForTesting
String basenameForTest(String path) => _basename(path);

/// Test-only access to the library-private 64-bit Hamming distance helper
/// used for perceptual image comparison.
@visibleForTesting
int hammingDistance64ForTest(String aHex, String bHex) =>
    _hammingDistance64(aHex, bHex);

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
