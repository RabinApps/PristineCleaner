import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/utils/format_utils.dart';

void main() {
  group('formatBytes', () {
    test('zero and negative values render as 0 B', () {
      expect(formatBytes(0), '0 B');
      expect(formatBytes(-1), '0 B');
      expect(formatBytes(-1024), '0 B');
    });

    test('values under 1 KB render in bytes', () {
      expect(formatBytes(1), '1 B');
      expect(formatBytes(1023), '1023 B');
    });

    test('kilobyte boundary and precision (1 decimal)', () {
      expect(formatBytes(1024), '1.0 KB');
      expect(formatBytes(1536), '1.5 KB');
      expect(formatBytes(1024 * 1024 - 1), '1024.0 KB');
    });

    test('megabyte boundary and precision (1 decimal)', () {
      expect(formatBytes(1024 * 1024), '1.0 MB');
      expect(formatBytes(1024 * 1024 * 3 ~/ 2), '1.5 MB');
      expect(formatBytes(1024 * 1024 * 1024 - 1), '1024.0 MB');
    });

    test('gigabyte boundary and precision (2 decimals)', () {
      expect(formatBytes(1024 * 1024 * 1024), '1.00 GB');
      final twoAndAQuarterGb = (2.25 * 1024 * 1024 * 1024).round();
      expect(formatBytes(twoAndAQuarterGb), '2.25 GB');
    });
  });
}
