import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/scan_view_model.dart';
import 'package:pristine_cleaner/providers/cleanup_provider.dart';
import 'package:pristine_cleaner/screens/cleanup_screen.dart';
import 'package:pristine_cleaner/shared/widgets/section_landing_layout.dart';

import '../test_support.dart';

class _FakeCleanupNotifier extends CleanupNotifier {
  final ScanViewModel seeded;

  _FakeCleanupNotifier(this.seeded);

  @override
  ScanViewModel build() => seeded;
}

void main() {
  testWidgets('CleanupScreen shows landing view when idle', (tester) async {
    await pumpLocalizedApp(
      tester,
      child: const CleanupScreen(),
      overrides: [
        cleanupProvider.overrideWith(
          () => _FakeCleanupNotifier(const ScanViewModel()),
        ),
      ],
    );

    expect(find.byType(SectionLandingLayout), findsOneWidget);
  });

  testWidgets('CleanupScreen shows done state when marked done', (
    tester,
  ) async {
    await pumpLocalizedApp(
      tester,
      child: const CleanupScreen(),
      overrides: [
        cleanupProvider.overrideWith(
          () => _FakeCleanupNotifier(const ScanViewModel(isDone: true)),
        ),
      ],
    );

    expect(find.textContaining('Done'), findsOneWidget);
  });
}
