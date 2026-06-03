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

  Future<ScanResult> scanAppLeftovers(
    FileService fileService, {
    ScanProgressCallback? onProgress,
  }) async {
    final payload = await fileService._runScanPayloadTask(
      task: 'scanAppLeftovers',
      args: const {},
      onProgress: onProgress,
    );
    return _scanResultFromPayload(payload);
  }
}

class _LeftoverAggregate {
  final String key;
  String displayName;
  String representativePath;
  int representativeBytes;
  DateTime modified;
  bool isDirectory;
  int totalBytes;

  _LeftoverAggregate({
    required this.key,
    required this.displayName,
    required this.representativePath,
    required this.representativeBytes,
    required this.modified,
    required this.isDirectory,
    required this.totalBytes,
  });

  void absorb(_LeftoverCandidate candidate) {
    totalBytes += candidate.sizeBytes;
    if (candidate.sizeBytes > representativeBytes) {
      representativeBytes = candidate.sizeBytes;
      representativePath = candidate.path;
      isDirectory = candidate.isDirectory;
    }
    if (candidate.modified.isAfter(modified)) {
      modified = candidate.modified;
    }
  }
}

class _LeftoverCandidate {
  final String key;
  final String displayName;
  final String path;
  final DateTime modified;
  final bool isDirectory;
  final int sizeBytes;

  const _LeftoverCandidate({
    required this.key,
    required this.displayName,
    required this.path,
    required this.modified,
    required this.isDirectory,
    required this.sizeBytes,
  });
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

  for (final entity in candidates) {
    if (isCancelled()) throw const ScanCancelledException();
    try {
      final stat = await entity.stat();
      final isDirectory = entity is Directory;
      final size = isDirectory ? await _dirSizePayload(entity.path) : stat.size;
      if (isCancelled()) throw const ScanCancelledException();
      final rawName = _basename(entity.path);
      final name = (Platform.isMacOS && isDirectory)
          ? rawName.replaceAll('.app', '')
          : rawName;
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
            iconPath: isDirectory
                ? await _resolveApplicationIconPath(entity.path)
                : null,
            lastUsed: stat.accessed,
            isDirectory: isDirectory,
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

Future<Map<String, dynamic>> _scanAppLeftoversPayload(
  void Function(ScanProgress progress) onProgress,
  bool Function() isCancelled,
) async {
  final sw = Stopwatch()..start();

  if (isCancelled()) throw const ScanCancelledException();
  onProgress(
    const ScanProgress(phase: ScanPhase.counting, processed: 0, total: 0),
  );

  if (isCancelled()) throw const ScanCancelledException();
  final roots = _appLeftoverRootsForCurrentPlatform();
  final installedIds =
      await _collectInstalledApplicationIdentifiersForLeftovers();
  final totalEntries = await _countTopLevelEntriesAcrossDirs(roots);

  if (isCancelled()) throw const ScanCancelledException();
  final emitter = _ProgressEmitter(emit: onProgress);
  emitter.push(ScanPhase.scanning, 0, totalEntries, force: true);

  final aggregates = <String, _LeftoverAggregate>{};
  int processed = 0;
  int processedBytes = 0;

  for (final rootPath in roots) {
    final root = Directory(rootPath);
    if (!await root.exists()) continue;

    try {
      await for (final entity in root.list(
        recursive: false,
        followLinks: false,
      )) {
        if (isCancelled()) throw const ScanCancelledException();
        processed++;

        final candidate = await _buildLeftoverCandidate(
          entity,
          installedIds: installedIds,
        );
        if (candidate != null) {
          processedBytes += candidate.sizeBytes;
          final existing = aggregates[candidate.key];
          if (existing == null) {
            aggregates[candidate.key] = _LeftoverAggregate(
              key: candidate.key,
              displayName: candidate.displayName,
              representativePath: candidate.path,
              representativeBytes: candidate.sizeBytes,
              modified: candidate.modified,
              isDirectory: candidate.isDirectory,
              totalBytes: candidate.sizeBytes,
            );
          } else {
            existing.absorb(candidate);
          }
        }

        emitter.push(
          ScanPhase.scanning,
          processed,
          totalEntries,
          processedBytes: processedBytes,
        );
      }
    } catch (_) {}
  }

  emitter.push(
    ScanPhase.scanning,
    totalEntries,
    totalEntries,
    processedBytes: processedBytes,
    force: true,
  );

  final items =
      aggregates.values
          .map(
            (entry) => _fileItemToPayload(
              FileItem(
                path: entry.representativePath,
                name: entry.displayName,
                sizeBytes: entry.totalBytes,
                modified: entry.modified,
                isDirectory: entry.isDirectory,
                category: 'app_leftover',
              ),
            ),
          )
          .toList(growable: false)
        ..sort(
          (a, b) => (b['sizeBytes'] as int).compareTo(a['sizeBytes'] as int),
        );

  sw.stop();
  final total = items.fold<int>(
    0,
    (sum, item) => sum + (item['sizeBytes'] as int),
  );
  return {
    'items': items,
    'totalBytes': total,
    'scanDurationMs': sw.elapsedMilliseconds,
  };
}

Future<int> _countTopLevelEntriesAcrossDirs(List<String> dirs) async {
  int total = 0;
  for (final path in dirs) {
    final dir = Directory(path);
    if (!await dir.exists()) continue;
    try {
      await for (final _ in dir.list(recursive: false, followLinks: false)) {
        total++;
      }
    } catch (_) {}
  }
  return total;
}

List<String> _appLeftoverRootsForCurrentPlatform() {
  final home =
      Platform.environment[Platform.isWindows ? 'USERPROFILE' : 'HOME'] ?? '';
  if (Platform.isMacOS) {
    return [
      '$home/Library/Application Support',
      '$home/Library/Caches',
      '$home/Library/Preferences',
      '$home/Library/Logs',
      '/Library/Application Support',
      '/Library/Caches',
      '/Library/Preferences',
      '/Library/Logs',
    ];
  }

  if (Platform.isWindows) {
    final local = Platform.environment['LOCALAPPDATA'] ?? '';
    final roaming = Platform.environment['APPDATA'] ?? '';
    return [if (local.isNotEmpty) local, if (roaming.isNotEmpty) roaming];
  }

  if (Platform.isLinux) {
    return ['$home/.config', '$home/.cache', '$home/.local/share/applications'];
  }

  return const [];
}

Future<Set<String>> _collectInstalledApplicationIdentifiers() async {
  final set = <String>{};
  final candidates = await _collectApplicationCandidates();
  for (final app in candidates) {
    final normalized = normalizeAppNameForMatching(_basename(app.path));
    if (normalized.isNotEmpty) {
      set.add(normalized);
    }
  }
  return set;
}

Future<Set<String>>
_collectInstalledApplicationIdentifiersForLeftovers() async {
  if (!Platform.isMacOS) {
    return _collectInstalledApplicationIdentifiers();
  }

  final set = <String>{};
  final appsDir = Directory('/Applications');
  if (!await appsDir.exists()) {
    return set;
  }

  try {
    await for (final entity in appsDir.list(followLinks: false)) {
      if (entity is! Directory || !entity.path.endsWith('.app')) {
        continue;
      }
      final normalized = normalizeAppNameForMatching(_basename(entity.path));
      if (normalized.isEmpty) {
        continue;
      }

      set.add(normalized);
      final words = normalized.split(' ');
      final tail = words.isEmpty ? '' : words.last;
      if (tail.length >= 5) {
        set.add(tail);
      }
    }
  } catch (_) {}

  return set;
}

Future<_LeftoverCandidate?> _buildLeftoverCandidate(
  FileSystemEntity entity, {
  required Set<String> installedIds,
}) async {
  final rawName = _basename(entity.path);
  if (!_isLeftoverRelevantEntry(entity, rawName)) {
    return null;
  }

  final key = normalizeAppNameForMatching(rawName);
  if (key.isEmpty ||
      _matchesInstalledApplicationIdentifier(key, installedIds)) {
    return null;
  }

  try {
    final stat = await entity.stat();
    final isDirectory = entity is Directory;
    final size = isDirectory ? await _dirSizePayload(entity.path) : stat.size;
    if (size <= 0) {
      return null;
    }

    return _LeftoverCandidate(
      key: key,
      displayName: appDisplayNameFromRaw(rawName),
      path: entity.path,
      modified: stat.modified,
      isDirectory: isDirectory,
      sizeBytes: size,
    );
  } catch (_) {
    return null;
  }
}

bool _matchesInstalledApplicationIdentifier(
  String key,
  Set<String> installedIds,
) {
  if (installedIds.contains(key)) {
    return true;
  }

  if (!Platform.isMacOS || key.length < 5) {
    return false;
  }

  for (final installed in installedIds) {
    if (installed.length < 5) {
      continue;
    }
    if (installed.contains(key) || key.contains(installed)) {
      return true;
    }
  }

  return false;
}

bool _isLeftoverRelevantEntry(FileSystemEntity entity, String rawName) {
  if (entity is Directory) {
    return true;
  }
  if (entity is! File) {
    return false;
  }

  final lower = rawName.toLowerCase();
  return lower.endsWith('.plist') ||
      lower.endsWith('.desktop') ||
      lower.endsWith('.ini') ||
      lower.endsWith('.conf') ||
      lower.endsWith('.cfg') ||
      lower.endsWith('.json') ||
      lower.endsWith('.xml');
}

String normalizeAppNameForMatching(String value) {
  var text = _basename(value).trim();
  if (text.isEmpty) return '';

  const removableSuffixes = [
    '.app',
    '.plist',
    '.desktop',
    '.lnk',
    '.json',
    '.xml',
    '.ini',
    '.conf',
    '.cfg',
    '.log',
    '.cache',
  ];
  final lower = text.toLowerCase();
  for (final suffix in removableSuffixes) {
    if (!lower.endsWith(suffix)) continue;
    text = text.substring(0, text.length - suffix.length);
    break;
  }

  final segments = text.split('.');
  final bundleLike =
      segments.length >= 3 &&
      segments.every(
        (segment) =>
            segment.isNotEmpty && RegExp(r'^[A-Za-z0-9_-]+$').hasMatch(segment),
      );
  if (bundleLike) {
    text = segments.last;
  }

  text = text
      .replaceAll(RegExp(r'[._-]+'), ' ')
      .replaceAll(RegExp(r'[^A-Za-z0-9 ]+'), ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim()
      .toLowerCase();

  if (text.isEmpty) return '';

  const ignored = {
    'cache',
    'caches',
    'logs',
    'log',
    'preferences',
    'preference',
    'application support',
    'applications',
    'application',
  };
  return ignored.contains(text) ? '' : text;
}

String appDisplayNameFromRaw(String value) {
  final normalized = normalizeAppNameForMatching(value);
  if (normalized.isEmpty) return value;
  final words = normalized.split(' ');
  return words
      .where((part) => part.isNotEmpty)
      .map((part) => '${part[0].toUpperCase()}${part.substring(1)}')
      .join(' ');
}

Future<List<FileSystemEntity>> _collectApplicationCandidates() async {
  final candidates = <FileSystemEntity>[];

  if (Platform.isMacOS) {
    for (final path in ['/Applications', '/System/Applications']) {
      final appsDir = Directory(path);
      if (!await appsDir.exists()) continue;
      await for (final entity in appsDir.list(followLinks: false)) {
        if (entity is Directory && entity.path.endsWith('.app')) {
          candidates.add(entity);
        }
      }
    }
    return candidates;
  }

  if (Platform.isWindows) {
    for (final dir in [r'C:\Program Files', r'C:\Program Files (x86)']) {
      final root = Directory(dir);
      if (!await root.exists()) continue;
      await for (final entity in root.list(followLinks: false)) {
        if (entity is Directory) {
          candidates.add(entity);
        }
      }
    }
    return candidates;
  }

  if (Platform.isLinux) {
    // Paths to scan on Linux (include executables, desktop files, opt dirs, and share/applications)
    final paths = [
      '/usr/bin',
      '/bin',
      '/usr/local/bin',
      '/opt',
      '/usr/share/applications',
      '/usr/lib',
    ];

    for (final rootPath in paths) {
      final root = Directory(rootPath);
      if (!await root.exists()) continue;
      try {
        await for (final entity in root.list(followLinks: false)) {
          // Include directories (useful for /opt and /usr/lib subdirs)
          if (entity is Directory) {
            candidates.add(entity);
            continue;
          }

          // Include .desktop files under /usr/share/applications
          if (entity is File) {
            final name = _basename(entity.path).toLowerCase();
            if (rootPath == '/usr/share/applications' &&
                name.endsWith('.desktop')) {
              candidates.add(entity);
              continue;
            }

            // For bin directories, include executable files
            if ((rootPath == '/usr/bin' ||
                rootPath == '/bin' ||
                rootPath == '/usr/local/bin')) {
              try {
                final stat = await entity.stat();
                // POSIX execute bits mask (0o111 == 73 decimal == 0x49)
                if ((stat.mode & 0x49) != 0 && stat.size > 0) {
                  candidates.add(entity);
                }
              } catch (_) {}
            }
          }
        }
      } catch (_) {}
    }
    return candidates;
  }

  return candidates;
}

Future<String?> _resolveApplicationIconPath(String appPath) async {
  // macOS: existing .app bundle logic
  if (Platform.isMacOS && appPath.endsWith('.app')) {
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

  // Linux: support .desktop files and directories
  if (Platform.isLinux) {
    try {
      if (appPath.endsWith('.desktop')) {
        final resolved = await _resolveLinuxIconFromDesktopFile(appPath);
        if (resolved != null) return resolved;
      }

      final dir = Directory(appPath);
      if (await dir.exists()) {
        final rawName = _basename(appPath);
        final candidates = [rawName, 'icon', 'app', 'logo'];
        try {
          await for (final entity in dir.list(followLinks: false)) {
            if (entity is! File) continue;
            final name = _basename(entity.path).toLowerCase();
            if (_supportedApplicationIconExtensions.any(
              (ext) => name.endsWith(ext),
            )) {
              if (name.contains('icon') ||
                  name.contains('app') ||
                  candidates.any((c) => name.startsWith(c.toLowerCase()))) {
                return entity.path;
              }
            }
          }
        } catch (_) {}

        // Try to find icons in standard icon dirs using raw name
        final found = await _findIconInDirs(rawName);
        if (found != null) return found;
      }
    } catch (_) {}
    return null;
  }

  // Windows: look for .ico or image files beside the exe or in the folder
  if (Platform.isWindows) {
    try {
      final resolved = await _resolveWindowsIconFromPath(appPath);
      if (resolved != null) return resolved;
    } catch (_) {}
    return null;
  }

  return null;
}

const _supportedApplicationIconExtensions = [
  '.png',
  '.jpg',
  '.jpeg',
  '.webp',
  '.svg',
  '.xpm',
  '.ico',
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

Future<String?> _findIconInDirs(String iconName) async {
  final home = Platform.environment['HOME'] ?? '';
  final iconDirs = [
    '/usr/share/icons/hicolor',
    '/usr/share/icons',
    '/usr/share/pixmaps',
    if (home.isNotEmpty) '$home/.local/share/icons',
    if (home.isNotEmpty) '$home/.icons',
  ];

  for (final dirPath in iconDirs) {
    try {
      final dir = Directory(dirPath);
      if (!await dir.exists()) continue;

      // Try direct matches first
      for (final ext in _supportedApplicationIconExtensions) {
        final candidate = File(
          '${dir.path}${Platform.pathSeparator}$iconName$ext',
        );
        if (await candidate.exists()) return candidate.path;
      }

      // Search one level deep for matches (common theme layouts)
      await for (final child in dir.list(followLinks: false)) {
        if (child is Directory) {
          try {
            await for (final file in child.list(followLinks: false)) {
              if (file is! File) continue;
              final name = _basename(file.path).toLowerCase();
              for (final ext in _supportedApplicationIconExtensions) {
                if (name == (iconName + ext).toLowerCase()) return file.path;
              }
            }
          } catch (_) {}
        }
      }
    } catch (_) {}
  }

  return null;
}

Future<String?> _resolveLinuxIconFromDesktopFile(String desktopPath) async {
  try {
    final file = File(desktopPath);
    if (!await file.exists()) return null;
    final content = await file.readAsLines();
    for (final raw in content) {
      final line = raw.trim();
      if (!line.startsWith('Icon=')) continue;
      final iconVal = line.substring(5).trim();
      if (iconVal.isEmpty) continue;
      // Absolute path
      if (iconVal.startsWith('/')) {
        if (await File(iconVal).exists()) return iconVal;
      }
      // If contains extension and relative path, try relative to desktop file
      final maybePath =
          '${Directory(desktopPath).parent.path}${Platform.pathSeparator}$iconVal';
      if (await File(maybePath).exists()) return maybePath;

      // Try icon theme dirs
      final found = await _findIconInDirs(iconVal);
      if (found != null) return found;

      // If iconVal has no extension, try common extensions
      for (final ext in _supportedApplicationIconExtensions) {
        final found2 = await _findIconInDirs(
          iconVal + ext.replaceFirst('.', ''),
        );
        if (found2 != null) return found2;
      }
    }
  } catch (_) {}
  return null;
}

Future<String?> _resolveWindowsIconFromPath(String path) async {
  try {
    final file = File(path);
    final dir = file.existsSync() ? file.parent : Directory(path);
    // If path is a directory, search inside
    if (await dir.exists()) {
      final folder = Directory(path);
      try {
        await for (final entity in folder.list(followLinks: false)) {
          if (entity is! File) continue;
          final name = _basename(entity.path).toLowerCase();
          if (name.endsWith('.ico') ||
              _supportedApplicationIconExtensions.any(
                (ext) => name.endsWith(ext),
              )) {
            return entity.path;
          }
        }
      } catch (_) {}
      return null;
    }

    // Otherwise look in same directory for matching icon files
    final parent = file.parent;
    final base = _stripFileExtension(_basename(file.path));
    for (final ext in _supportedApplicationIconExtensions) {
      final candidate = File(
        '${parent.path}${Platform.pathSeparator}$base$ext',
      );
      if (await candidate.exists()) return candidate.path;
    }

    // Generic icon.* matches
    try {
      await for (final entity in parent.list(followLinks: false)) {
        if (entity is! File) continue;
        final name = _basename(entity.path).toLowerCase();
        if (name.startsWith('icon') || name.startsWith(base)) {
          if (_supportedApplicationIconExtensions.any(
            (ext) => name.endsWith(ext),
          )) {
            return entity.path;
          }
        }
      }
    } catch (_) {}
  } catch (_) {}
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
