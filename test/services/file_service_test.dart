import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/file_item.dart';
import 'package:pristine_cleaner/core/models/scan_result.dart';
import 'package:pristine_cleaner/core/models/space_view_snapshot.dart';
import 'package:pristine_cleaner/services/file_service.dart';

void main() {
  group('FileService scan behavior', () {
    late Directory root;

    setUp(() async {
      root = await Directory.systemTemp.createTemp('pc-file-service-');
    });

    tearDown(() async {
      if (await root.exists()) {
        await root.delete(recursive: true);
      }
    });

    test('scanLargeFiles returns only files above threshold', () async {
      final small = File('${root.path}/small.txt');
      final large = File('${root.path}/large.bin');

      await small.writeAsBytes(List<int>.filled(12, 0));
      await large.writeAsBytes(List<int>.filled(96, 1));

      final service = FileService();
      final result = await service.scanLargeFiles(root.path, minSizeBytes: 64);

      expect(result.items.length, 1);
      expect(result.items.first.name, 'large.bin');
      expect(result.items.first.sizeBytes, 96);
    });

    test('scanLargeAndOldFiles filters by size and age', () async {
      final oldLarge = File('${root.path}/old-large.log');
      final newLarge = File('${root.path}/new-large.log');

      await oldLarge.writeAsBytes(List<int>.filled(120, 2));
      await newLarge.writeAsBytes(List<int>.filled(120, 3));
      await oldLarge.setLastModified(
        DateTime.now().subtract(const Duration(days: 480)),
      );

      final service = FileService();
      final result = await service.scanLargeAndOldFiles(
        root.path,
        minSizeBytes: 100,
        minAge: const Duration(days: 365),
      );

      expect(result.items.map((item) => item.name), contains('old-large.log'));
      expect(
        result.items.map((item) => item.name),
        isNot(contains('new-large.log')),
      );
    });

    test('getDiskInfo returns a valid shape', () async {
      final service = FileService();
      final info = await service.getDiskInfo();

      expect(info.totalBytes, greaterThanOrEqualTo(0));
      expect(info.usedBytes, greaterThanOrEqualTo(0));
      expect(info.freeBytes, greaterThanOrEqualTo(0));
    });
  });

  group('Service delegation through FileService', () {
    test('scanCleanup delegates to CleanupService', () async {
      final fake = _FakeCleanupService();
      final service = FileService(cleanupService: fake);

      final result = await service.scanCleanup();

      expect(fake.called, isTrue);
      expect(result.items.single.name, 'cleanup.log');
    });

    test('scanApplications delegates to ApplicationsService', () async {
      final fake = _FakeApplicationsService();
      final service = FileService(applicationsService: fake);

      final result = await service.scanApplications();

      expect(fake.called, isTrue);
      expect(result.items.single.name, 'Preview');
    });

    test('scanAppLeftovers delegates to ApplicationsService', () async {
      final fake = _FakeApplicationsService();
      final service = FileService(applicationsService: fake);

      final result = await service.scanAppLeftovers();

      expect(fake.leftoversCalled, isTrue);
      expect(result.items.single.name, 'Old Tool');
    });

    test('scanFreshDuplicates delegates to DuplicatesService', () async {
      final fake = _FakeDuplicatesService();
      final service = FileService(duplicatesService: fake);

      final result = await service.scanFreshDuplicates('/tmp');

      expect(fake.called, isTrue);
      expect(result.items.single.category, 'fresh_duplicates');
    });

    test('scanLargeSimilarImages delegates to ImagesService', () async {
      final fake = _FakeImagesService();
      final service = FileService(imagesService: fake);

      final result = await service.scanLargeSimilarImages('/tmp');

      expect(fake.called, isTrue);
      expect(result.items.single.category, 'large_similar_images');
    });

    test('space view calls delegate to SpaceViewService', () async {
      final fake = _FakeSpaceViewService();
      final service = FileService(spaceViewService: fake);

      final folders = await service.getTopFolders('/tmp');
      final snapshot = await service.scanSpaceViewSnapshot('/tmp');
      final listing = await service.listDirectoryContents('/tmp');

      expect(fake.getTopFoldersCalled, isTrue);
      expect(fake.snapshotCalled, isTrue);
      expect(fake.listCalled, isTrue);
      expect(folders.single.name, 'Top');
      expect(snapshot.topFolders.single.name, 'Top');
      expect(listing.single.name, 'child.txt');
    });
  });
}

class _FakeCleanupService extends CleanupService {
  bool called = false;

  @override
  Future<ScanResult> scanCleanup(
    FileService fileService, {
    ScanProgressCallback? onProgress,
  }) async {
    called = true;
    onProgress?.call(
      const ScanProgress(phase: ScanPhase.scanning, processed: 1, total: 1),
    );
    return ScanResult(
      items: [
        FileItem(
          path: '/cleanup.log',
          name: 'cleanup.log',
          sizeBytes: 42,
          modified: DateTime(2024),
          isDirectory: false,
        ),
      ],
      totalBytes: 42,
      scanDuration: const Duration(milliseconds: 1),
    );
  }
}

class _FakeApplicationsService extends ApplicationsService {
  bool called = false;
  bool leftoversCalled = false;

  @override
  Future<ScanResult> scanApplications(
    FileService fileService, {
    ScanProgressCallback? onProgress,
  }) async {
    called = true;
    return ScanResult(
      items: [
        FileItem(
          path: '/Applications/Preview.app',
          name: 'Preview',
          sizeBytes: 55,
          modified: DateTime(2024),
          isDirectory: true,
        ),
      ],
      totalBytes: 55,
      scanDuration: const Duration(milliseconds: 1),
    );
  }

  @override
  Future<ScanResult> scanAppLeftovers(
    FileService fileService, {
    ScanProgressCallback? onProgress,
  }) async {
    leftoversCalled = true;
    return ScanResult(
      items: [
        FileItem(
          path: '/Users/user/Library/Caches/OldTool',
          name: 'Old Tool',
          sizeBytes: 77,
          modified: DateTime(2024),
          isDirectory: true,
          category: 'app_leftover',
        ),
      ],
      totalBytes: 77,
      scanDuration: const Duration(milliseconds: 1),
    );
  }
}

class _FakeDuplicatesService extends DuplicatesService {
  bool called = false;

  @override
  Future<ScanResult> scanFreshDuplicates(
    FileService fileService,
    String rootPath, {
    Duration freshWindow = const Duration(days: 90),
    ScanProgressCallback? onProgress,
  }) async {
    called = true;
    return ScanResult(
      items: [
        FileItem(
          path: '/a.txt',
          name: 'a.txt',
          sizeBytes: 10,
          modified: DateTime(2024),
          isDirectory: false,
          category: 'fresh_duplicates',
          group: 'Duplicate Group 1',
        ),
      ],
      totalBytes: 10,
      scanDuration: const Duration(milliseconds: 1),
    );
  }
}

class _FakeImagesService extends ImagesService {
  bool called = false;

  @override
  Future<ScanResult> scanLargeSimilarImages(
    FileService fileService,
    String rootPath, {
    int minSizeBytes = 5 * 1024 * 1024,
    int maxHammingDistance = 8,
    ScanProgressCallback? onProgress,
  }) async {
    called = true;
    return ScanResult(
      items: [
        FileItem(
          path: '/photo.png',
          name: 'photo.png',
          sizeBytes: 80,
          modified: DateTime(2024),
          isDirectory: false,
          category: 'large_similar_images',
          group: 'Similar Images 1',
        ),
      ],
      totalBytes: 80,
      scanDuration: const Duration(milliseconds: 1),
    );
  }
}

class _FakeSpaceViewService extends SpaceViewService {
  bool getTopFoldersCalled = false;
  bool snapshotCalled = false;
  bool listCalled = false;

  @override
  Future<List<FileItem>> getTopFolders(
    FileService fileService,
    String rootPath, {
    int limit = 25,
    ScanProgressCallback? onProgress,
  }) async {
    getTopFoldersCalled = true;
    return [
      FileItem(
        path: '/tmp/Top',
        name: 'Top',
        sizeBytes: 12,
        modified: DateTime(2024),
        isDirectory: true,
      ),
    ];
  }

  @override
  Future<SpaceViewSnapshot> scanSpaceViewSnapshot(
    FileService fileService,
    String rootPath, {
    int topFolderLimit = 30,
    ScanProgressCallback? onProgress,
  }) async {
    snapshotCalled = true;
    final top = FileItem(
      path: '/tmp/Top',
      name: 'Top',
      sizeBytes: 12,
      modified: DateTime(2024),
      isDirectory: true,
    );
    return SpaceViewSnapshot(
      rootPath: '/tmp',
      topFolders: [top],
      itemsByPath: {
        '/tmp': [top],
      },
    );
  }

  @override
  Future<List<FileItem>> listDirectoryContents(
    FileService fileService,
    String dirPath, {
    bool includeHidden = false,
    int maxItems = 500,
  }) async {
    listCalled = true;
    return [
      FileItem(
        path: '/tmp/child.txt',
        name: 'child.txt',
        sizeBytes: 1,
        modified: DateTime(2024),
        isDirectory: false,
      ),
    ];
  }
}
