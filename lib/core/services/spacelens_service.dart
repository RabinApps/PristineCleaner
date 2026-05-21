part of 'file_service.dart';

class SpaceLensService {
  const SpaceLensService();

  Future<List<FileItem>> getTopFolders(
    FileService fileService,
    String rootPath, {
    int limit = 25,
    ScanProgressCallback? onProgress,
  }) async {
    final payload = await fileService._runScanPayloadTask(
      task: 'topFolders',
      args: {'rootPath': rootPath, 'limit': limit},
      onProgress: onProgress,
    );
    final itemsPayload = (payload['items'] as List<dynamic>)
        .cast<Map<String, dynamic>>();
    return itemsPayload.map(_fileItemFromPayload).toList(growable: false);
  }

  Future<SpaceLensSnapshot> scanSpaceLensSnapshot(
    FileService fileService,
    String rootPath, {
    int topFolderLimit = 30,
    ScanProgressCallback? onProgress,
  }) async {
    final payload = await fileService._runScanPayloadTask(
      task: 'spaceLensSnapshot',
      args: {'rootPath': rootPath, 'topFolderLimit': topFolderLimit},
      onProgress: onProgress,
    );
    return _spaceLensSnapshotFromPayload(payload);
  }

  Future<List<FileItem>> listDirectoryContents(
    FileService fileService,
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
}

class _SpaceLensWorkerMessage {
  final String rootPath;
  final SendPort sendPort;

  const _SpaceLensWorkerMessage({
    required this.rootPath,
    required this.sendPort,
  });
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
