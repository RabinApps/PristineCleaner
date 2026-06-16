import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/services/file_service.dart';

void main() {
  group('hammingDistance64', () {
    test('identical hashes have distance 0', () {
      expect(hammingDistance64ForTest('0000000000000000', '0000000000000000'),
          0);
      expect(hammingDistance64ForTest('ffffffffffffffff', 'ffffffffffffffff'),
          0);
    });

    test('counts differing bits', () {
      // 0x...1 vs 0x...0 differs by a single bit.
      expect(hammingDistance64ForTest('0000000000000001', '0000000000000000'),
          1);
      // 0xF (1111) vs 0x0 (0000) differs by four bits.
      expect(hammingDistance64ForTest('000000000000000f', '0000000000000000'),
          4);
      // All bits set vs none set differ by all 64 bits.
      expect(hammingDistance64ForTest('ffffffffffffffff', '0000000000000000'),
          64);
    });

    test('is symmetric', () {
      expect(
        hammingDistance64ForTest('00ff00ff00ff00ff', 'ff00ff00ff00ff00'),
        hammingDistance64ForTest('ff00ff00ff00ff00', '00ff00ff00ff00ff'),
      );
    });
  });

  group('basename', () {
    test('returns the final path segment', () {
      final sep = Platform.pathSeparator;
      expect(basenameForTest('${sep}a${sep}b${sep}file.txt'), 'file.txt');
    });

    test('returns the input when there is no separator', () {
      expect(basenameForTest('solo.txt'), 'solo.txt');
    });
  });
}
