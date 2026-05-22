import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/scan_view_model.dart';
import 'package:pristine_cleaner/providers/space_view_provider.dart';
import 'package:pristine_cleaner/screens/space_view_screen.dart';
import 'package:pristine_cleaner/shared/widgets/project_directory_selector.dart';

import '../test_support.dart';

class _FakeSpaceViewNotifier extends SpaceViewNotifier {
  final ScanViewModel seeded;

  _FakeSpaceViewNotifier(this.seeded);

  @override
  ScanViewModel build() => seeded;
}

void main() {
  testWidgets('SpaceViewScreen shows start view with directory picker', (
    tester,
  ) async {
    await pumpLocalizedApp(
      tester,
      child: const SpaceViewScreen(),
      overrides: [
        spaceViewProvider.overrideWith(
          () => _FakeSpaceViewNotifier(
            const ScanViewModel(
              selectedParentPath: '/',
              selectedParentName: '/',
              currentPath: '/',
              currentName: '/',
              breadcrumbs: ['/'],
            ),
          ),
        ),
      ],
    );

    expect(find.byType(ProjectDirectorySelector), findsOneWidget);
  });
}
