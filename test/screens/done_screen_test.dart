import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/theme/section_themes.dart';
import 'package:pristine_cleaner/screens/done_screen.dart';

import '../test_support.dart';

void main() {
  testWidgets('DoneScreen renders completion content and action button', (
    tester,
  ) async {
    await pumpLocalizedApp(
      tester,
      child: DoneScreen(theme: SectionThemes.cleanup, onDismiss: () {}),
    );

    expect(find.textContaining('Done'), findsOneWidget);
    expect(find.byType(OutlinedButton), findsOneWidget);
  });
}
