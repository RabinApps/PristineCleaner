import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/file_item.dart';
import 'package:pristine_cleaner/core/models/scan_result.dart';
import 'package:pristine_cleaner/providers/cleanup_provider.dart';
import 'package:pristine_cleaner/services/file_service.dart';
import 'package:pristine_cleaner/services/trash_service.dart';

import '../test_support.dart';

void main() {
  setUpAll(useEnglishLocale);

  test('scan, select toggles, and clean update cleanup state', () async {
    final fileService = _BlockingCleanupFileService();
    final trashService = _RecordingTrashService();
    final container = ProviderContainer(
      overrides: [
        fileServiceProvider.overrideWithValue(fileService),
        trashServiceProvider.overrideWithValue(trashService),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(cleanupProvider.notifier);
    final scanFuture = notifier.scan();
    await Future<void>.delayed(Duration.zero);

    expect(container.read(cleanupProvider).isScanning, isTrue);

    fileService.complete(
      testScanResult([
        testFileItem(
          path: '/cache/a.log',
          name: 'a.log',
          sizeBytes: 10,
          category: 'user_cache',
          group: 'cache-a',
        ),
        testFileItem(
          path: '/cache/b.log',
          name: 'b.log',
          sizeBytes: 20,
          category: 'user_cache',
          group: 'cache-b',
        ),
      ]),
    );
    await scanFuture;

    expect(container.read(cleanupProvider).hasResults, isTrue);
    expect(container.read(cleanupProvider).result?.items, hasLength(2));

    notifier.toggleGroup('user_cache', 'cache-a', false);
    expect(
      container.read(cleanupProvider).result!.items.first.isSelected,
      isFalse,
    );
    expect(
      container.read(cleanupProvider).result!.items.last.isSelected,
      isTrue,
    );

    notifier.toggleCategory('user_cache', false);
    expect(
      container
          .read(cleanupProvider)
          .result!
          .items
          .every((item) => item.isSelected == false),
      isTrue,
    );

    notifier.selectAll();
    expect(
      container
          .read(cleanupProvider)
          .result!
          .items
          .every((item) => item.isSelected),
      isTrue,
    );

    await notifier.clean();
    expect(trashService.deletedItems, hasLength(2));
    expect(container.read(cleanupProvider).isDone, isTrue);
  });
}

class _BlockingCleanupFileService extends FileService {
  final Completer<ScanResult> _completer = Completer<ScanResult>();

  @override
  Future<ScanResult> scanCleanup({ScanProgressCallback? onProgress}) {
    onProgress?.call(
      const ScanProgress(phase: ScanPhase.counting, processed: 0, total: 2),
    );
    onProgress?.call(
      const ScanProgress(phase: ScanPhase.scanning, processed: 1, total: 2),
    );
    return _completer.future;
  }

  void complete(ScanResult result) {
    if (!_completer.isCompleted) {
      _completer.complete(result);
    }
  }
}

class _RecordingTrashService extends TrashService {
  List<FileItem> deletedItems = const [];

  @override
  Future<List<String>> deleteItems(
    List<FileItem> items, {
    bool permanent = false,
  }) async {
    deletedItems = List<FileItem>.from(items);
    return const <String>[];
  }
}
