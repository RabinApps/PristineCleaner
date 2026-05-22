part of 'file_service.dart';

class DuplicatesService {
  const DuplicatesService();

  Future<ScanResult> scanFreshDuplicates(
    FileService fileService,
    String rootPath, {
    Duration freshWindow = const Duration(days: 90),
    ScanProgressCallback? onProgress,
  }) async {
    final cutoffMs = DateTime.now()
        .subtract(freshWindow)
        .millisecondsSinceEpoch;
    final payload = await fileService._runScanPayloadTask(
      task: 'scanFreshDuplicates',
      args: {'rootPath': rootPath, 'cutoffMs': cutoffMs},
      onProgress: onProgress,
    );
    return _scanResultFromPayload(payload);
  }
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
