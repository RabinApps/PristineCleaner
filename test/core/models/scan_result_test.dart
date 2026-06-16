import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/scan_result.dart';

import '../../test_support.dart';

void main() {
  group('ScanResult', () {
    test('selectedItems / selectedBytes only count selected items', () {
      final result = testScanResult([
        testFileItem(path: '/a', name: 'a', sizeBytes: 100, isSelected: true),
        testFileItem(path: '/b', name: 'b', sizeBytes: 200, isSelected: false),
        testFileItem(path: '/c', name: 'c', sizeBytes: 300, isSelected: true),
      ]);

      expect(result.selectedItems.map((i) => i.name), ['a', 'c']);
      expect(result.selectedBytes, 400);
      expect(result.totalBytes, 600);
    });

    test('withUpdatedItems preserves totalBytes and duration', () {
      final result = testScanResult([
        testFileItem(path: '/a', name: 'a', sizeBytes: 100),
      ]);
      final updated = result.withUpdatedItems([
        testFileItem(path: '/a', name: 'a', sizeBytes: 100, isSelected: false),
      ]);

      expect(updated.totalBytes, result.totalBytes);
      expect(updated.scanDuration, result.scanDuration);
      expect(updated.selectedBytes, 0);
    });

    test('formatted getters delegate to formatBytes', () {
      final result = testScanResult([
        testFileItem(path: '/a', name: 'a', sizeBytes: 2048, isSelected: true),
      ]);
      expect(result.formattedTotal, '2.0 KB');
      expect(result.formattedSelected, '2.0 KB');
    });
  });

  group('ScanProgress', () {
    test('percent clamps and handles zero total', () {
      expect(
        const ScanProgress(phase: ScanPhase.scanning, processed: 0, total: 0)
            .percent,
        0,
      );
      expect(
        const ScanProgress(phase: ScanPhase.scanning, processed: 5, total: 10)
            .percent,
        0.5,
      );
      expect(
        const ScanProgress(phase: ScanPhase.scanning, processed: 20, total: 10)
            .percent,
        1.0,
      );
    });

    test('percentLabel renders whole percentages', () {
      expect(
        const ScanProgress(phase: ScanPhase.scanning, processed: 1, total: 4)
            .percentLabel,
        '25%',
      );
    });
  });

  group('DiskInfo', () {
    test('usedPercent guards against zero total', () {
      const empty = DiskInfo(
        mountPoint: '/',
        totalBytes: 0,
        usedBytes: 0,
        freeBytes: 0,
      );
      expect(empty.usedPercent, 0.0);

      const half = DiskInfo(
        mountPoint: '/',
        totalBytes: 1000,
        usedBytes: 500,
        freeBytes: 500,
      );
      expect(half.usedPercent, 0.5);
    });
  });

  group('SystemUsage', () {
    test('unavailable reports zeroes and not available', () {
      const usage = SystemUsage.unavailable();
      expect(usage.isAvailable, isFalse);
      expect(usage.cpuFraction, 0.0);
      expect(usage.memoryUsedPercent, 0.0);
    });

    test('computed fractions clamp into [0,1]', () {
      const usage = SystemUsage(
        cpuPercent: 150,
        totalMemoryBytes: 1000,
        usedMemoryBytes: 250,
      );
      expect(usage.cpuFraction, 1.0);
      expect(usage.memoryUsedPercent, 0.25);
    });
  });
}
