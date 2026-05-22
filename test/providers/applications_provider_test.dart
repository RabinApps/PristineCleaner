import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/file_item.dart';
import 'package:pristine_cleaner/core/models/scan_result.dart';
import 'package:pristine_cleaner/providers/applications_provider.dart';
import 'package:pristine_cleaner/services/file_service.dart';
import 'package:pristine_cleaner/services/trash_service.dart';

import '../test_support.dart';

void main() {
  setUpAll(useEnglishLocale);

  test(
    'scan, selection toggles, and clean update applications state',
    () async {
      final fileService = _BlockingApplicationsFileService();
      final trashService = _RecordingTrashService();
      final container = ProviderContainer(
        overrides: [
          fileServiceProvider.overrideWithValue(fileService),
          trashServiceProvider.overrideWithValue(trashService),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(applicationsProvider.notifier);
      final scanFuture = notifier.scan();
      await Future<void>.delayed(Duration.zero);

      expect(container.read(applicationsProvider).isScanning, isTrue);

      fileService.complete(
        testScanResult([
          testFileItem(
            path: '/Applications/AppOne.app',
            name: 'AppOne.app',
            sizeBytes: 100,
            isDirectory: true,
          ),
          testFileItem(
            path: '/Applications/AppTwo.app',
            name: 'AppTwo.app',
            sizeBytes: 200,
            isDirectory: true,
          ),
        ]),
      );
      await scanFuture;

      expect(container.read(applicationsProvider).hasResults, isTrue);
      expect(container.read(applicationsProvider).result?.items, hasLength(2));

      notifier.toggleItem(0);
      expect(
        container.read(applicationsProvider).result!.items.first.isSelected,
        isFalse,
      );

      notifier.selectAll();
      expect(
        container
            .read(applicationsProvider)
            .result!
            .items
            .every((item) => item.isSelected),
        isTrue,
      );

      notifier.deselectAll();
      expect(
        container
            .read(applicationsProvider)
            .result!
            .items
            .every((item) => !item.isSelected),
        isTrue,
      );

      notifier.selectAll();
      await notifier.clean();
      expect(trashService.deletedItems, hasLength(2));
      expect(container.read(applicationsProvider).isDone, isTrue);
    },
  );
}

class _BlockingApplicationsFileService extends FileService {
  final Completer<ScanResult> _completer = Completer<ScanResult>();

  @override
  Future<ScanResult> scanApplications({ScanProgressCallback? onProgress}) {
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
