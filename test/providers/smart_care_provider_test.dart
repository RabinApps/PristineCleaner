import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/scan_result.dart';
import 'package:pristine_cleaner/providers/smart_care_provider.dart';
import 'package:pristine_cleaner/services/file_service.dart';

import '../test_support.dart';

void main() {
  setUpAll(useEnglishLocale);

  test('build and refresh update disk info state', () async {
    final fileService = _QueuedDiskInfoFileService([
      const DiskInfo(
        mountPoint: '/',
        totalBytes: 1000,
        usedBytes: 600,
        freeBytes: 400,
      ),
      const DiskInfo(
        mountPoint: '/',
        totalBytes: 2000,
        usedBytes: 1200,
        freeBytes: 800,
      ),
    ]);
    final container = ProviderContainer(
      overrides: [fileServiceProvider.overrideWithValue(fileService)],
    );
    addTearDown(container.dispose);

    final initial = await container.read(smartCareProvider.future);
    expect(initial.totalBytes, 1000);
    expect(container.read(smartCareProvider).hasValue, isTrue);

    await container.read(smartCareProvider.notifier).refresh();

    final refreshed = container.read(smartCareProvider).value;
    expect(refreshed?.totalBytes, 2000);
    expect(fileService.calls, 2);
  });
}

class _QueuedDiskInfoFileService extends FileService {
  final List<DiskInfo> responses;
  int calls = 0;

  _QueuedDiskInfoFileService(this.responses);

  @override
  Future<DiskInfo> getDiskInfo() async {
    calls++;
    return responses[calls - 1];
  }
}
