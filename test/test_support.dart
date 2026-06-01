import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/file_item.dart';
import 'package:pristine_cleaner/core/models/scan_result.dart';
import 'package:pristine_cleaner/gen/strings.g.dart';

Future<void> pumpLocalizedApp(
  WidgetTester tester, {
  required Widget child,
  List<Override> overrides = const <Override>[],
}) async {
  tester.view.physicalSize = const Size(1400, 900);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(
    TranslationProvider(
      child: ProviderScope(
        overrides: overrides,
        child: MaterialApp(home: Scaffold(body: child)),
      ),
    ),
  );
  await tester.pump();
}

void useEnglishLocale() {
  LocaleSettings.setLocaleSync(AppLocale.en);
}

FileItem testFileItem({
  required String path,
  required String name,
  int sizeBytes = 128,
  bool isDirectory = false,
  bool isSelected = true,
  String? category,
  String? group,
}) {
  return FileItem(
    path: path,
    name: name,
    sizeBytes: sizeBytes,
    modified: DateTime(2024, 1, 1),
    isDirectory: isDirectory,
    isSelected: isSelected,
    category: category,
    group: group,
  );
}

ScanResult testScanResult(List<FileItem> items) {
  final total = items.fold<int>(0, (sum, item) => sum + item.sizeBytes);
  return ScanResult(
    items: items,
    totalBytes: total,
    scanDuration: const Duration(milliseconds: 5),
  );
}
