import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/my_tool.dart';
import 'package:pristine_cleaner/providers/my_tools_provider.dart';
import 'package:pristine_cleaner/screens/my_tools_screen.dart';

import '../test_support.dart';

class _FakeMyToolsNotifier extends MyToolsNotifier {
  final MyToolsState seeded;

  _FakeMyToolsNotifier(this.seeded);

  @override
  MyToolsState build() => seeded;
}

void main() {
  testWidgets('MyToolsScreen renders provided tool cards', (tester) async {
    final tool = MyTool(
      id: 'downloads',
      title: 'Downloads',
      description: 'Clean downloaded files',
      icon: Icons.download_rounded,
      accentColor: const Color(0xFF29CAD6),
      scanType: MyToolScanType.downloads,
    );

    await pumpLocalizedApp(
      tester,
      child: const MyToolsScreen(),
      overrides: [
        myToolsProvider.overrideWith(
          () => _FakeMyToolsNotifier(MyToolsState(tools: [tool])),
        ),
      ],
    );

    expect(find.text('Downloads'), findsOneWidget);
  });
}
