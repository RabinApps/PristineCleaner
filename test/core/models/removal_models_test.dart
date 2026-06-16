import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/removal_models.dart';

import '../../test_support.dart';

void main() {
  group('RemovalCancellationToken', () {
    test('starts unset and latches once requested', () {
      final token = RemovalCancellationToken();
      expect(token.isStopRequested, isFalse);
      token.requestStop();
      expect(token.isStopRequested, isTrue);
    });
  });

  group('RemovalProgress', () {
    test('fraction guards zero total and clamps', () {
      expect(
        const RemovalProgress(
          processedItems: 0,
          totalItems: 0,
          deletedItems: 0,
          deletedBytes: 0,
        ).fraction,
        0,
      );
      expect(
        const RemovalProgress(
          processedItems: 1,
          totalItems: 4,
          deletedItems: 1,
          deletedBytes: 0,
        ).fraction,
        0.25,
      );
    });

    test('remainingItems never goes negative', () {
      expect(
        const RemovalProgress(
          processedItems: 5,
          totalItems: 3,
          deletedItems: 3,
          deletedBytes: 0,
        ).remainingItems,
        0,
      );
      expect(
        const RemovalProgress(
          processedItems: 2,
          totalItems: 5,
          deletedItems: 2,
          deletedBytes: 0,
        ).remainingItems,
        3,
      );
    });
  });

  group('RemovalOutcome', () {
    test('deletedCount reflects deleted list length', () {
      final outcome = RemovalOutcome(
        deletedItems: [
          testFileItem(path: '/a', name: 'a'),
          testFileItem(path: '/b', name: 'b'),
        ],
        deletedBytes: 256,
      );
      expect(outcome.deletedCount, 2);
      expect(outcome.errors, isEmpty);
      expect(outcome.stoppedByUser, isFalse);
    });
  });
}
