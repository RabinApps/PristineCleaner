part of 'file_service.dart';

class ApplicationsService {
  const ApplicationsService();

  Future<ScanResult> scanApplications(
    FileService fileService, {
    ScanProgressCallback? onProgress,
  }) async {
    final payload = await fileService._runScanPayloadTask(
      task: 'scanApplications',
      args: const {},
      onProgress: onProgress,
    );
    return _scanResultFromPayload(payload);
  }
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
