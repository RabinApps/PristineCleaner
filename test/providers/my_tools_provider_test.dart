import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/file_item.dart';
import 'package:pristine_cleaner/core/models/removal_models.dart';
import 'package:pristine_cleaner/core/models/scan_result.dart';
import 'package:pristine_cleaner/core/models/my_tool.dart';
import 'package:pristine_cleaner/providers/my_tools_provider.dart';
import 'package:pristine_cleaner/services/file_service.dart';

import '../test_support.dart';

void main() {
  setUpAll(useEnglishLocale);

  test(
    'query filtering and directory selection update my tools state',
    () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(myToolsProvider.notifier);
      final state = container.read(myToolsProvider);

      expect(state.tools, isNotEmpty);

      notifier.setQuery('downloads');
      expect(container.read(myToolsProvider).filteredTools, hasLength(1));
      expect(
        container.read(myToolsProvider).filteredTools.single.id,
        'downloads',
      );

      final directoryTool = state.tools.firstWhere(
        (tool) => tool.scanType == MyToolScanType.largeAndOldFiles,
      );
      notifier.setToolDirectory(directoryTool.id, '/tmp/custom-tool-dir');

      expect(notifier.directoryForTool(directoryTool), '/tmp/custom-tool-dir');
    },
  );

  test('runTool and removal outcome update active detail state', () async {
    final fileService = _BlockingDownloadsFileService();
    final container = ProviderContainer(
      overrides: [fileServiceProvider.overrideWithValue(fileService)],
    );
    addTearDown(container.dispose);

    final notifier = container.read(myToolsProvider.notifier);
    final tool = container
        .read(myToolsProvider)
        .tools
        .firstWhere((entry) => entry.scanType == MyToolScanType.downloads);

    final runFuture = notifier.runTool(tool);
    await Future<void>.delayed(Duration.zero);

    expect(container.read(myToolsProvider).runningToolIds, contains(tool.id));

    fileService.complete(
      ScanResult(
        items: [
          FileItem(
            path: '/Downloads/a.zip',
            name: 'a.zip',
            sizeBytes: 100,
            modified: DateTime(2024),
            isDirectory: false,
          ),
          FileItem(
            path: '/Downloads/b.zip',
            name: 'b.zip',
            sizeBytes: 50,
            modified: DateTime(2024),
            isDirectory: false,
          ),
        ],
        totalBytes: 150,
        scanDuration: const Duration(milliseconds: 1),
      ),
    );
    await runFuture;

    final afterRun = container.read(myToolsProvider);
    expect(afterRun.activeDetailToolId, tool.id);
    expect(afterRun.activeDetailResult, isNotNull);
    expect(afterRun.summaries[tool.id], isNotNull);

    notifier.applyActiveDetailRemovalOutcome(
      outcome: RemovalOutcome(
        deletedItems: [afterRun.activeDetailResult!.items.first],
        deletedBytes: afterRun.activeDetailResult!.items.first.sizeBytes,
        errors: const ['b.zip: failed'],
        stoppedByUser: true,
      ),
    );

    final afterRemoval = container.read(myToolsProvider);
    expect(afterRemoval.activeDetailResult!.items, hasLength(1));
    expect(afterRemoval.activeDetailResult!.items.first.name, 'b.zip');
    expect(afterRemoval.lastNotice, isNotNull);
    expect(afterRemoval.summaries[tool.id], isNotNull);
  });
}

class _BlockingDownloadsFileService extends FileService {
  final Completer<ScanResult> _completer = Completer<ScanResult>();

  @override
  Future<ScanResult> scanDownloads({ScanProgressCallback? onProgress}) {
    onProgress?.call(
      const ScanProgress(phase: ScanPhase.counting, processed: 0, total: 2),
    );
    onProgress?.call(
      const ScanProgress(phase: ScanPhase.scanning, processed: 1, total: 2),
    );
    return _completer.future;
  }

  void complete(ScanResult result) {
    if (!_completer.isCompleted) {
      _completer.complete(result);
    }
  }
}
