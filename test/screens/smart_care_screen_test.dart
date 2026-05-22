import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/scan_result.dart';
import 'package:pristine_cleaner/providers/smart_care_provider.dart';
import 'package:pristine_cleaner/screens/smart_care_screen.dart';

import '../test_support.dart';

class _FakeSmartCareNotifier extends SmartCareNotifier {
  @override
  Future<DiskInfo> build() async {
    return const DiskInfo(
      mountPoint: '/',
      totalBytes: 1000,
      usedBytes: 500,
      freeBytes: 500,
    );
  }
}

void main() {
  testWidgets('SmartCareScreen renders stats and refresh control', (
    tester,
  ) async {
    await pumpLocalizedApp(
      tester,
      child: const SmartCareScreen(),
      overrides: [smartCareProvider.overrideWith(_FakeSmartCareNotifier.new)],
    );

    expect(find.text('50%'), findsOneWidget);
    expect(find.textContaining('Refresh'), findsOneWidget);
  });
}
