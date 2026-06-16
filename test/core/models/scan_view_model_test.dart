import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/scan_view_model.dart';

import '../../test_support.dart';

void main() {
  group('ScanViewModel', () {
    ScanViewModel withItems() => ScanViewModel(
      result: testScanResult([
        testFileItem(path: '/a', name: 'a', isSelected: false),
        testFileItem(path: '/b', name: 'b', isSelected: true),
      ]),
    );

    test('isIdle is true only for a blank model', () {
      expect(const ScanViewModel().isIdle, isTrue);
      expect(const ScanViewModel(isScanning: true).isIdle, isFalse);
      expect(const ScanViewModel(isCleaning: true).isIdle, isFalse);
      expect(const ScanViewModel(isDone: true).isIdle, isFalse);
      expect(withItems().isIdle, isFalse);
    });

    test('hasResults requires a result and not scanning', () {
      expect(withItems().hasResults, isTrue);
      expect(const ScanViewModel().hasResults, isFalse);
      expect(
        withItems().copyWith(isScanning: true).hasResults,
        isFalse,
      );
    });

    test('withToggled flips selection of the targeted item', () {
      final vm = withItems().withToggled(0);
      expect(vm.result!.items[0].isSelected, isTrue);
      expect(vm.result!.items[1].isSelected, isTrue);
    });

    test('withToggled ignores out-of-range indexes', () {
      final vm = withItems();
      expect(identical(vm.withToggled(-1), vm), isTrue);
      expect(identical(vm.withToggled(99), vm), isTrue);
    });

    test('withToggled is a no-op when there is no result', () {
      const vm = ScanViewModel();
      expect(identical(vm.withToggled(0), vm), isTrue);
    });

    test('withAllSelected sets every item', () {
      final selected = withItems().withAllSelected(true);
      expect(selected.result!.items.every((i) => i.isSelected), isTrue);

      final cleared = withItems().withAllSelected(false);
      expect(cleared.result!.items.any((i) => i.isSelected), isFalse);
    });

    test('copyWith clear flags reset nullable fields', () {
      final vm = ScanViewModel(
        result: testScanResult([]),
        progressPercent: 0.5,
        progressLabel: '50%',
        error: 'boom',
        currentPath: '/x',
        currentName: 'x',
        breadcrumbs: const ['a', 'b'],
      );

      final cleared = vm.copyWith(
        clearResult: true,
        clearProgress: true,
        clearError: true,
        clearCurrentPath: true,
        clearCurrentName: true,
        clearBreadcrumbs: true,
      );

      expect(cleared.result, isNull);
      expect(cleared.progressPercent, isNull);
      expect(cleared.progressLabel, isNull);
      expect(cleared.error, isNull);
      expect(cleared.currentPath, isNull);
      expect(cleared.currentName, isNull);
      expect(cleared.breadcrumbs, isEmpty);
    });
  });
}
