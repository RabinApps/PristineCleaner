import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/scan_view_model.dart';
import 'package:pristine_cleaner/providers/my_clutter_provider.dart';
import 'package:pristine_cleaner/screens/my_clutter_screen.dart';
import 'package:pristine_cleaner/shared/widgets/project_directory_selector.dart';

import '../test_support.dart';

class _FakeMyClutterNotifier extends MyClutterNotifier {
  final MyClutterState seeded;

  _FakeMyClutterNotifier(this.seeded);

  @override
  MyClutterState build() => seeded;
}

void main() {
  testWidgets('MyClutterScreen shows landing picker when idle', (tester) async {
    await pumpLocalizedApp(
      tester,
      child: const MyClutterScreen(),
      overrides: [
        myClutterProvider.overrideWith(
          () => _FakeMyClutterNotifier(
            const MyClutterState(
              vm: ScanViewModel(
                selectedParentPath: '/',
                selectedParentName: '/',
              ),
            ),
          ),
        ),
      ],
    );

    expect(find.byType(ProjectDirectorySelector), findsOneWidget);
  });

  testWidgets('MyClutterScreen shows done screen when finished', (
    tester,
  ) async {
    await pumpLocalizedApp(
      tester,
      child: const MyClutterScreen(),
      overrides: [
        myClutterProvider.overrideWith(
          () => _FakeMyClutterNotifier(
            const MyClutterState(vm: ScanViewModel(isDone: true)),
          ),
        ),
      ],
    );

    expect(find.textContaining('Done'), findsOneWidget);
  });
}
