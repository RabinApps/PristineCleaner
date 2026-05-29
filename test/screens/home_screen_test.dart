import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/scan_result.dart';
import 'package:pristine_cleaner/providers/home_provider.dart';
import 'package:pristine_cleaner/screens/home_screen.dart';

import '../test_support.dart';

class _FakeHomeNotifier extends HomeNotifier {
  @override
  Future<HomeDashboardData> build() async {
    return HomeDashboardData(
      diskInfo: const DiskInfo(
        mountPoint: '/',
        totalBytes: 1000,
        usedBytes: 500,
        freeBytes: 500,
      ),
      systemUsage: const SystemUsage(
        cpuPercent: 12.5,
        totalMemoryBytes: 16000000000,
        usedMemoryBytes: 8000000000,
      ),
      updatedAt: DateTime.now(),
    );
  }
}

void main() {
  testWidgets('HomeScreen renders dashboard stats', (tester) async {
    await pumpLocalizedApp(
      tester,
      child: const HomeScreen(),
      overrides: [homeProvider.overrideWith(_FakeHomeNotifier.new)],
    );

    expect(find.byType(LinearProgressIndicator), findsNWidgets(2));
    expect(find.textContaining('%'), findsWidgets);
  });
}
