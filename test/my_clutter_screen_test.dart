import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/screens/my_clutter_screen.dart';

void main() {
  testWidgets('shows project directory picker and no scan type selector', (
    tester,
  ) async {
    final binding = tester.binding;
    await binding.setSurfaceSize(const Size(1400, 900));
    addTearDown(() => binding.setSurfaceSize(null));

    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: Scaffold(body: MyClutterScreen())),
      ),
    );

    expect(find.byIcon(Icons.keyboard_arrow_down_rounded), findsOneWidget);
    expect(find.text('Scan for'), findsNothing);
  });
}
