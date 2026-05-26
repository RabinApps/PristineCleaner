import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import 'package:pristine_cleaner/main.dart' as app;
import 'package:pristine_cleaner/screens/applications_screen.dart';
import 'package:pristine_cleaner/screens/cleanup_screen.dart';
import 'package:pristine_cleaner/screens/my_clutter_screen.dart';
import 'package:pristine_cleaner/screens/my_tools_screen.dart';
import 'package:pristine_cleaner/screens/home_screen.dart';
import 'package:pristine_cleaner/screens/space_view_screen.dart';
import 'package:pristine_cleaner/shared/widgets/scan_button.dart';
import 'package:pristine_cleaner/shared/widgets/shell/shell_screen.dart';

void main() {
  patrolTest('launches and navigates to Cleanup on macOS', ($) async {
    app.main();
    await $.pumpAndSettle();

    expect($(ShellScreen), findsOneWidget);
    expect($(HomeScreen), findsOneWidget);

    await $(Icons.cleaning_services_rounded).tap();
    await $.pumpAndSettle();

    expect($(CleanupScreen), findsOneWidget);
  });

  patrolTest('navigates through all sidebar sections', ($) async {
    app.main();
    await $.pumpAndSettle();

    expect($(HomeScreen), findsOneWidget);

    await $(Icons.cleaning_services_rounded).tap();
    await $.pumpAndSettle();
    expect($(CleanupScreen), findsOneWidget);

    await $(Icons.folder_outlined).tap();
    await $.pumpAndSettle();
    expect($(MyClutterScreen), findsOneWidget);

    await $(Icons.lens_blur_rounded).tap();
    await $.pumpAndSettle();
    expect($(SpaceViewScreen), findsOneWidget);

    await $(Icons.apps_rounded).tap();
    await $.pumpAndSettle();
    expect($(ApplicationsScreen), findsOneWidget);

    await $(Icons.build_outlined).tap();
    await $.pumpAndSettle();
    expect($(MyToolsScreen), findsOneWidget);

    await $(Icons.bar_chart_rounded).tap();
    await $.pumpAndSettle();
    expect($(ComingSoonScreen), findsOneWidget);

    await $(Icons.favorite_rounded).tap();
    await $.pumpAndSettle();
    expect($(HomeScreen), findsOneWidget);
  });

  patrolTest('triggers Home refresh action', ($) async {
    app.main();
    await $.pumpAndSettle();

    expect($(HomeScreen), findsOneWidget);
    expect($(ScanButton), findsOneWidget);

    await $(ScanButton).tap();
    await $.pumpAndSettle();

    expect($(HomeScreen), findsOneWidget);
  });
}
