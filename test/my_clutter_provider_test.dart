import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/file_item.dart';
import 'package:pristine_cleaner/core/models/scan_result.dart';
import 'package:pristine_cleaner/services/file_service.dart';
import 'package:pristine_cleaner/providers/my_clutter_provider.dart';

void main() {
  group('MyClutterNotifier', () {
    test('scan runs all clutter scans and merges results', () async {
      final fake = _FakeFileService();
      final container = ProviderContainer(
        overrides: [fileServiceProvider.overrideWithValue(fake)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(myClutterProvider.notifier);
      await notifier.scan();

      expect(fake.freshDuplicatesCalls, 1);
      expect(fake.largeSimilarImagesCalls, 1);
      expect(fake.largeFilesCalls, 1);
      expect(container.read(myClutterProvider).vm.result!.items, hasLength(3));
    });

    test('setParentFolder updates selected parent path', () async {
      final fake = _FakeFileService();
      final container = ProviderContainer(
        overrides: [fileServiceProvider.overrideWithValue(fake)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(myClutterProvider.notifier);
      await notifier.setParentFolder('/tmp/project_dir');

      expect(
        container.read(myClutterProvider).vm.selectedParentPath,
        '/tmp/project_dir',
      );
    });

    test('stop cancels all active parallel scans at once', () async {
      final fake = _BlockingFakeFileService();
      final container = ProviderContainer(
        overrides: [fileServiceProvider.overrideWithValue(fake)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(myClutterProvider.notifier);
      final scanFuture = notifier.scan();
      await Future<void>.delayed(Duration.zero);

      notifier.stop();
      await scanFuture;

      expect(fake.largeFilesCalls, 1);
      expect(fake.freshDuplicatesCalls, 1);
      expect(fake.largeSimilarImagesCalls, 1);
      expect(fake.cancelCalls, 1);
      expect(container.read(myClutterProvider).vm.isScanning, false);
    });
  });
}

class _FakeFileService extends FileService {
  int largeFilesCalls = 0;
  int freshDuplicatesCalls = 0;
  int largeSimilarImagesCalls = 0;

  @override
  Future<ScanResult> scanLargeFiles(
    String rootPath, {
    int minSizeBytes = 50 * 1024 * 1024,
    ScanProgressCallback? onProgress,
  }) async {
    largeFilesCalls++;
    return ScanResult(
      items: [
        FileItem(
          path: '/scan/large.mov',
          name: 'large.mov',
          sizeBytes: 600,
          modified: DateTime(2020),
          isDirectory: false,
        ),
      ],
      totalBytes: 600,
      scanDuration: const Duration(milliseconds: 10),
    );
  }

  @override
  Future<ScanResult> scanFreshDuplicates(
    String rootPath, {
    Duration freshWindow = const Duration(days: 90),
    ScanProgressCallback? onProgress,
  }) async {
    freshDuplicatesCalls++;
    return ScanResult(
      items: [
        FileItem(
          path: '/scan/dup.mov',
          name: 'dup.mov',
          sizeBytes: 300,
          modified: DateTime(2020),
          isDirectory: false,
          category: 'fresh_duplicates',
        ),
      ],
      totalBytes: 300,
      scanDuration: const Duration(milliseconds: 10),
    );
  }

  @override
  Future<ScanResult> scanLargeSimilarImages(
    String rootPath, {
    int minSizeBytes = 5 * 1024 * 1024,
    int maxHammingDistance = 8,
    ScanProgressCallback? onProgress,
  }) async {
    largeSimilarImagesCalls++;
    return ScanResult(
      items: [
        FileItem(
          path: '/scan/similar.png',
          name: 'similar.png',
          sizeBytes: 200,
          modified: DateTime(2020),
          isDirectory: false,
          category: 'large_similar_images',
        ),
      ],
      totalBytes: 200,
      scanDuration: const Duration(milliseconds: 10),
    );
  }
}

class _BlockingFakeFileService extends FileService {
  int largeFilesCalls = 0;
  int freshDuplicatesCalls = 0;
  int largeSimilarImagesCalls = 0;
  int cancelCalls = 0;

  final List<Completer<ScanResult>> _pending = [];

  Future<ScanResult> _block() {
    final completer = Completer<ScanResult>();
    _pending.add(completer);
    return completer.future;
  }

  @override
  Future<ScanResult> scanLargeFiles(
    String rootPath, {
    int minSizeBytes = 50 * 1024 * 1024,
    ScanProgressCallback? onProgress,
  }) {
    largeFilesCalls++;
    return _block();
  }

  @override
  Future<ScanResult> scanFreshDuplicates(
    String rootPath, {
    Duration freshWindow = const Duration(days: 90),
    ScanProgressCallback? onProgress,
  }) {
    freshDuplicatesCalls++;
    return _block();
  }

  @override
  Future<ScanResult> scanLargeSimilarImages(
    String rootPath, {
    int minSizeBytes = 5 * 1024 * 1024,
    int maxHammingDistance = 8,
    ScanProgressCallback? onProgress,
  }) {
    largeSimilarImagesCalls++;
    return _block();
  }

  @override
  void cancelActiveScan() {
    cancelCalls++;
    for (final completer in _pending) {
      if (!completer.isCompleted) {
        completer.completeError(const ScanCancelledException());
      }
    }
    _pending.clear();
  }
}
