import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/file_item.dart';
import 'package:pristine_cleaner/core/models/scan_result.dart';
import 'package:pristine_cleaner/core/models/space_lens_snapshot.dart';
import 'package:pristine_cleaner/services/file_service.dart';
import 'package:pristine_cleaner/providers/space_lens_provider.dart';

void main() {
  group('SpaceLensNotifier', () {
    test('scan builds snapshot once and navigation uses cache', () async {
      final fake = _FakeSpaceLensFileService();
      final container = ProviderContainer(
        overrides: [fileServiceProvider.overrideWithValue(fake)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(spaceLensProvider.notifier);
      await notifier.setParentFolder('/root');
      await notifier.scan();

      expect(fake.snapshotCalls, 1);
      expect(fake.listDirectoryCalls, 0);
      expect(container.read(spaceLensProvider).result?.items, hasLength(2));

      final rootFolders = container.read(spaceLensProvider).result!.items;
      await notifier.navigateIntoFolder(rootFolders.first);
      expect(container.read(spaceLensProvider).currentPath, '/root/A');
      expect(container.read(spaceLensProvider).result?.items, hasLength(2));
      expect(fake.listDirectoryCalls, 0);

      await notifier.navigateToBreadcrumb(0);
      expect(container.read(spaceLensProvider).currentPath, '/root');
      expect(fake.listDirectoryCalls, 0);

      await notifier.refreshCurrentFolder();
      expect(fake.listDirectoryCalls, 0);
    });

    test(
      'setParentFolder clears cache and falls back to directory listing',
      () async {
        final fake = _FakeSpaceLensFileService();
        final container = ProviderContainer(
          overrides: [fileServiceProvider.overrideWithValue(fake)],
        );
        addTearDown(container.dispose);

        final notifier = container.read(spaceLensProvider.notifier);
        await notifier.setParentFolder('/root');
        await notifier.scan();

        await notifier.setParentFolder('/other');
        await notifier.refreshCurrentFolder();

        expect(fake.listDirectoryCalls, 1);
        expect(container.read(spaceLensProvider).currentPath, '/other');
      },
    );

    test('cancelled scan returns to idle state', () async {
      final fake = _CancelledSnapshotFileService();
      final container = ProviderContainer(
        overrides: [fileServiceProvider.overrideWithValue(fake)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(spaceLensProvider.notifier);
      await notifier.setParentFolder('/root');
      await notifier.scan();

      final vm = container.read(spaceLensProvider);
      expect(vm.isScanning, false);
      expect(vm.result, isNull);
      expect(vm.error, isNull);
    });

    test('stop surfaces cancellation from snapshot worker path', () async {
      final fake = _BlockingSnapshotFileService();
      final container = ProviderContainer(
        overrides: [fileServiceProvider.overrideWithValue(fake)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(spaceLensProvider.notifier);
      await notifier.setParentFolder('/root');

      final scanFuture = notifier.scan();
      await Future<void>.delayed(Duration.zero);

      notifier.stop();
      await scanFuture;

      final vm = container.read(spaceLensProvider);
      expect(fake.cancelCalls, 1);
      expect(vm.isScanning, false);
      expect(vm.result, isNull);
      expect(vm.error, isNull);
    });
  });
}

class _FakeSpaceLensFileService extends FileService {
  int snapshotCalls = 0;
  int listDirectoryCalls = 0;

  @override
  Future<SpaceLensSnapshot> scanSpaceLensSnapshot(
    String rootPath, {
    int topFolderLimit = 30,
    ScanProgressCallback? onProgress,
  }) async {
    snapshotCalls++;
    final dirA = _dir('/root/A', 'A', 220);
    final dirB = _dir('/root/B', 'B', 120);
    final fileA = _file('/root/A/file.txt', 'file.txt', 40);
    final nestedA = _dir('/root/A/nested', 'nested', 180);
    final nestedFile = _file('/root/A/nested/photo.jpg', 'photo.jpg', 180);

    return SpaceLensSnapshot(
      rootPath: rootPath,
      topFolders: [dirA, dirB].take(topFolderLimit).toList(growable: false),
      itemsByPath: {
        '/root': [dirA, dirB],
        '/root/A': [nestedA, fileA],
        '/root/A/nested': [nestedFile],
        '/root/B': const [],
      },
    );
  }

  @override
  Future<List<FileItem>> listDirectoryContents(
    String dirPath, {
    bool includeHidden = false,
    int maxItems = 500,
  }) async {
    listDirectoryCalls++;
    return const [];
  }
}

class _CancelledSnapshotFileService extends FileService {
  @override
  Future<SpaceLensSnapshot> scanSpaceLensSnapshot(
    String rootPath, {
    int topFolderLimit = 30,
    ScanProgressCallback? onProgress,
  }) async {
    throw const ScanCancelledException();
  }
}

class _BlockingSnapshotFileService extends FileService {
  int cancelCalls = 0;
  final Completer<SpaceLensSnapshot> _snapshotCompleter =
      Completer<SpaceLensSnapshot>();

  @override
  Future<SpaceLensSnapshot> scanSpaceLensSnapshot(
    String rootPath, {
    int topFolderLimit = 30,
    ScanProgressCallback? onProgress,
  }) {
    onProgress?.call(
      const ScanProgress(phase: ScanPhase.scanning, processed: 0, total: 1),
    );
    return _snapshotCompleter.future;
  }

  @override
  void cancelActiveScan() {
    cancelCalls++;
    if (!_snapshotCompleter.isCompleted) {
      _snapshotCompleter.completeError(const ScanCancelledException());
    }
  }
}

FileItem _dir(String path, String name, int sizeBytes) {
  return FileItem(
    path: path,
    name: name,
    sizeBytes: sizeBytes,
    modified: DateTime(2024),
    isDirectory: true,
  );
}

FileItem _file(String path, String name, int sizeBytes) {
  return FileItem(
    path: path,
    name: name,
    sizeBytes: sizeBytes,
    modified: DateTime(2024),
    isDirectory: false,
  );
}
