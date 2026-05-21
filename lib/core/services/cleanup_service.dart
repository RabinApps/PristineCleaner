part of 'file_service.dart';

class CleanupService {
  const CleanupService();

  Future<ScanResult> scanCleanup(
    FileService fileService, {
    ScanProgressCallback? onProgress,
  }) async {
    final payload = await fileService._runScanPayloadTask(
      task: 'scanCleanupCategorized',
      args: {'categories': _cleanupCategoryDirs(fileService._home)},
      onProgress: onProgress,
    );
    return _scanResultFromPayload(payload);
  }
}

Map<String, List<String>> _cleanupCategoryDirs(String home) {
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
