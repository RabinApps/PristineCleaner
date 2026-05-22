import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/services/file_service.dart';

void main() {
  group('SpaceViewService', () {
    late Directory root;

    setUp(() async {
      root = await Directory.systemTemp.createTemp('pc-space-view-service-');
    });

    tearDown(() async {
      if (await root.exists()) {
        await root.delete(recursive: true);
      }
    });

    test(
      'listDirectoryContents hides hidden files and sorts directories first',
      () async {
        final childDir = Directory('${root.path}/folder');
        await childDir.create(recursive: true);
        await File('${root.path}/visible.txt').writeAsString('v');
        await File('${root.path}/.hidden.txt').writeAsString('h');

        final service = SpaceViewService();
        final fileService = FileService();

        final items = await service.listDirectoryContents(
          fileService,
          root.path,
          includeHidden: false,
        );

        expect(items.map((i) => i.name), contains('folder'));
        expect(items.map((i) => i.name), contains('visible.txt'));
        expect(items.map((i) => i.name), isNot(contains('.hidden.txt')));
        expect(items.first.isDirectory, isTrue);
      },
    );

    test('listDirectoryContents respects maxItems', () async {
      await File('${root.path}/1.txt').writeAsString('1');
      await File('${root.path}/2.txt').writeAsString('2');
      await File('${root.path}/3.txt').writeAsString('3');

      final service = SpaceViewService();
      final fileService = FileService();
      final items = await service.listDirectoryContents(
        fileService,
        root.path,
        maxItems: 2,
      );

      expect(items.length, 2);
    });
  });
}
