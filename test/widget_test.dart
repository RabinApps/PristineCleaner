// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pristine_cleaner/app.dart';
import 'package:pristine_cleaner/core/models/scan_result.dart';
import 'package:pristine_cleaner/gen/strings.g.dart';
import 'package:pristine_cleaner/providers/smart_care_provider.dart';

class _FakeSmartCareNotifier extends SmartCareNotifier {
  @override
  Future<DiskInfo> build() async {
    return const DiskInfo(
      mountPoint: '/',
      totalBytes: 1024,
      usedBytes: 512,
      freeBytes: 512,
    );
  }
}

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1140, 740);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      TranslationProvider(
        child: ProviderScope(
          overrides: [
            smartCareProvider.overrideWith(_FakeSmartCareNotifier.new),
          ],
          child: const PristineCleanerApp(),
        ),
      ),
    );

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
