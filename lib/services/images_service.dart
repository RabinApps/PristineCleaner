part of 'file_service.dart';

class ImagesService {
  const ImagesService();

  Future<ScanResult> scanLargeSimilarImages(
    FileService fileService,
    String rootPath, {
    int minSizeBytes = 5 * 1024 * 1024,
    int maxHammingDistance = 8,
    ScanProgressCallback? onProgress,
  }) async {
    final payload = await fileService._runScanPayloadTask(
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
