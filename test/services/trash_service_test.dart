import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/file_item.dart';
import 'package:pristine_cleaner/core/models/removal_models.dart';
import 'package:pristine_cleaner/services/trash_service.dart';

void main() {
  group('TrashService', () {
    late Directory root;

    setUp(() async {
      root = await Directory.systemTemp.createTemp('pc-trash-service-');
    });

    tearDown(() async {
      if (await root.exists()) {
        await root.delete(recursive: true);
      }
    });

    test('deleteItemsTracked permanently removes files', () async {
      final file = File('${root.path}/remove-me.txt');
      await file.writeAsString('hello');

      final service = TrashService();
      final outcome = await service.deleteItemsTracked([
        FileItem(
          path: file.path,
          name: 'remove-me.txt',
          sizeBytes: 5,
          modified: DateTime(2024),
          isDirectory: false,
          isSelected: true,
        ),
      ], permanent: true);

      expect(outcome.errors, isEmpty);
      expect(outcome.deletedCount, 1);
      expect(await file.exists(), isFalse);
    });

    test('deleteItemsTracked stops when cancellation requested', () async {
      final fileA = File('${root.path}/a.txt');
      final fileB = File('${root.path}/b.txt');
      await fileA.writeAsString('A');
      await fileB.writeAsString('B');

      final token = RemovalCancellationToken();
      final service = TrashService();

      final outcome = await service.deleteItemsTracked(
        [
          FileItem(
            path: fileA.path,
            name: 'a.txt',
            sizeBytes: 1,
            modified: DateTime(2024),
            isDirectory: false,
            isSelected: true,
          ),
          FileItem(
            path: fileB.path,
            name: 'b.txt',
            sizeBytes: 1,
            modified: DateTime(2024),
            isDirectory: false,
            isSelected: true,
          ),
        ],
        permanent: true,
        cancellationToken: token,
        onProgress: (progress) {
          if (progress.processedItems == 1) {
            token.requestStop();
          }
        },
      );

      expect(outcome.stoppedByUser, isTrue);
      expect(outcome.deletedCount, 1);
      expect(await fileA.exists(), isFalse);
      expect(await fileB.exists(), isTrue);
    });

    test(
      'non-permanent delete reports an error and keeps the file when '
      'move-to-trash fails (no silent permanent delete)',
      () async {
        final file = File('${root.path}/keep-me.txt');
        await file.writeAsString('precious');

        // Inject a move-to-trash that always fails.
        final service = TrashService(moveToTrash: (_) async => false);
        final outcome = await service.deleteItemsTracked([
          FileItem(
            path: file.path,
            name: 'keep-me.txt',
            sizeBytes: 8,
            modified: DateTime(2024),
            isDirectory: false,
            isSelected: true,
          ),
        ]);

        expect(outcome.deletedCount, 0);
        expect(outcome.errors, hasLength(1));
        expect(outcome.errors.single, contains('keep-me.txt'));
        // The file must NOT have been permanently deleted as a fallback.
        expect(await file.exists(), isTrue);
      },
    );

    test(
      'permanent delete still removes the file even when trash would fail',
      () async {
        final file = File('${root.path}/gone.txt');
        await file.writeAsString('bye');

        final service = TrashService(moveToTrash: (_) async => false);
        final outcome = await service.deleteItemsTracked([
          FileItem(
            path: file.path,
            name: 'gone.txt',
            sizeBytes: 3,
            modified: DateTime(2024),
            isDirectory: false,
            isSelected: true,
          ),
        ], permanent: true);

        expect(outcome.errors, isEmpty);
        expect(outcome.deletedCount, 1);
        expect(await file.exists(), isFalse);
      },
    );
  });
}
