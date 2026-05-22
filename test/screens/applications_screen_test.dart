import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/scan_view_model.dart';
import 'package:pristine_cleaner/providers/applications_provider.dart';
import 'package:pristine_cleaner/screens/applications_screen.dart';
import 'package:pristine_cleaner/shared/widgets/section_landing_layout.dart';

import '../test_support.dart';

class _FakeApplicationsNotifier extends ApplicationsNotifier {
  final ScanViewModel seeded;

  _FakeApplicationsNotifier(this.seeded);

  @override
  ScanViewModel build() => seeded;
}

void main() {
  testWidgets('ApplicationsScreen shows landing view when idle', (
    tester,
  ) async {
    await pumpLocalizedApp(
      tester,
      child: const ApplicationsScreen(),
      overrides: [
        applicationsProvider.overrideWith(
          () => _FakeApplicationsNotifier(const ScanViewModel()),
        ),
      ],
    );

    expect(find.byType(SectionLandingLayout), findsOneWidget);
  });

  testWidgets('ApplicationsScreen shows done state when marked done', (
    tester,
  ) async {
    await pumpLocalizedApp(
      tester,
      child: const ApplicationsScreen(),
      overrides: [
        applicationsProvider.overrideWith(
          () => _FakeApplicationsNotifier(const ScanViewModel(isDone: true)),
        ),
      ],
    );

    expect(find.textContaining('Done'), findsOneWidget);
  });
}
