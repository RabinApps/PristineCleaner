import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/nav_item.dart';
import 'package:pristine_cleaner/core/models/scan_view_model.dart';
import 'package:pristine_cleaner/providers/applications_provider.dart';
import 'package:pristine_cleaner/providers/cleanup_provider.dart';
import 'package:pristine_cleaner/providers/my_clutter_provider.dart';
import 'package:pristine_cleaner/providers/my_tools_provider.dart';
import 'package:pristine_cleaner/providers/space_view_provider.dart';
import 'package:pristine_cleaner/shared/widgets/shell/sidebar/sidebar_widget.dart';

import '../../../../test_support.dart';

class _FakeCleanupNotifier extends CleanupNotifier {
  final ScanViewModel seeded;

  _FakeCleanupNotifier(this.seeded);

  @override
  ScanViewModel build() => seeded;
}

class _FakeApplicationsNotifier extends ApplicationsNotifier {
  final ScanViewModel seeded;

  _FakeApplicationsNotifier(this.seeded);

  @override
  ScanViewModel build() => seeded;
}

class _FakeSpaceViewNotifier extends SpaceViewNotifier {
  final ScanViewModel seeded;

  _FakeSpaceViewNotifier(this.seeded);

  @override
  ScanViewModel build() => seeded;
}

class _FakeMyClutterNotifier extends MyClutterNotifier {
  final MyClutterState seeded;

  _FakeMyClutterNotifier(this.seeded);

  @override
  MyClutterState build() => seeded;
}

class _FakeMyToolsNotifier extends MyToolsNotifier {
  final MyToolsState seeded;

  _FakeMyToolsNotifier(this.seeded);

  @override
  MyToolsState build() => seeded;
}

void main() {
  Future<void> pumpSidebar(
    WidgetTester tester, {
    required NavSection activeSection,
    ScanViewModel cleanupVm = const ScanViewModel(),
    MyClutterState clutterState = const MyClutterState(),
    ScanViewModel spaceViewVm = const ScanViewModel(),
    ScanViewModel applicationsVm = const ScanViewModel(),
    MyToolsState toolsState = const MyToolsState(tools: []),
  }) async {
    await pumpLocalizedApp(
      tester,
      child: SidebarWidget(activeSection: activeSection),
      overrides: <Override>[
        cleanupProvider.overrideWith(() => _FakeCleanupNotifier(cleanupVm)),
        myClutterProvider.overrideWith(
          () => _FakeMyClutterNotifier(clutterState),
        ),
        spaceViewProvider.overrideWith(
          () => _FakeSpaceViewNotifier(spaceViewVm),
        ),
        applicationsProvider.overrideWith(
          () => _FakeApplicationsNotifier(applicationsVm),
        ),
        myToolsProvider.overrideWith(() => _FakeMyToolsNotifier(toolsState)),
      ],
    );
  }

  testWidgets('shows active dot when section is active and not scanning', (
    tester,
  ) async {
    await pumpSidebar(tester, activeSection: NavSection.cleanup);

    expect(find.byKey(const Key('sidebar-active-dot-cleanup')), findsOneWidget);
    expect(find.byKey(const Key('sidebar-scan-cleanup')), findsNothing);
  });

  testWidgets('shows scan spinner on inactive section with active scan', (
    tester,
  ) async {
    await pumpSidebar(
      tester,
      activeSection: NavSection.home,
      cleanupVm: const ScanViewModel(isScanning: true, progressPercent: 0.42),
    );

    expect(find.byKey(const Key('sidebar-scan-cleanup')), findsOneWidget);
    expect(find.byKey(const Key('sidebar-active-dot-cleanup')), findsNothing);
  });

  testWidgets('shows spinner instead of dot on active section while scanning', (
    tester,
  ) async {
    await pumpSidebar(
      tester,
      activeSection: NavSection.cleanup,
      cleanupVm: const ScanViewModel(isScanning: true, progressPercent: 0.51),
    );

    expect(find.byKey(const Key('sidebar-scan-cleanup')), findsOneWidget);
    expect(find.byKey(const Key('sidebar-active-dot-cleanup')), findsNothing);
  });

  testWidgets('uses indeterminate spinner for tools when any tool is running', (
    tester,
  ) async {
    await pumpSidebar(
      tester,
      activeSection: NavSection.home,
      toolsState: const MyToolsState(
        tools: [],
        runningToolIds: {'running-tool'},
      ),
    );

    final indicator = tester.widget<CircularProgressIndicator>(
      find.byKey(const Key('sidebar-scan-myTools')),
    );

    expect(indicator.value, isNull);
  });

  testWidgets('passes determinate progress value for scanned sections', (
    tester,
  ) async {
    await pumpSidebar(
      tester,
      activeSection: NavSection.home,
      cleanupVm: const ScanViewModel(isScanning: true, progressPercent: 0.73),
    );

    final indicator = tester.widget<CircularProgressIndicator>(
      find.byKey(const Key('sidebar-scan-cleanup')),
    );

    expect(indicator.value, 0.73);
  });
}
