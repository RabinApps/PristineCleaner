import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/scan_result.dart';
import 'package:pristine_cleaner/providers/home_provider.dart';
import 'package:pristine_cleaner/services/file_service.dart';

import '../test_support.dart';

void main() {
  setUpAll(useEnglishLocale);

  test('build and refresh update disk info state', () async {
    final fileService = _QueuedHomeStatsFileService(
      diskResponses: [
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
      ],
      systemResponses: [
        const SystemUsage(
          cpuPercent: 10,
          totalMemoryBytes: 32000000000,
          usedMemoryBytes: 12000000000,
        ),
        const SystemUsage(
          cpuPercent: 20,
          totalMemoryBytes: 32000000000,
          usedMemoryBytes: 16000000000,
        ),
      ],
    );
    final container = ProviderContainer(
      overrides: [fileServiceProvider.overrideWithValue(fileService)],
    );
    addTearDown(container.dispose);

    final initial = await container.read(homeProvider.future);
    expect(initial.diskInfo.totalBytes, 1000);
    expect(initial.systemUsage.cpuPercent, 10);
    expect(container.read(homeProvider).hasValue, isTrue);

    await container.read(homeProvider.notifier).refresh();

    final refreshed = container.read(homeProvider).value;
    expect(refreshed?.diskInfo.totalBytes, 2000);
    expect(refreshed?.systemUsage.cpuPercent, 20);
    expect(fileService.diskCalls, 2);
    expect(fileService.systemCalls, 2);
  });
}

class _QueuedHomeStatsFileService extends FileService {
  final List<DiskInfo> diskResponses;
  final List<SystemUsage> systemResponses;
  int diskCalls = 0;
  int systemCalls = 0;

  _QueuedHomeStatsFileService({
    required this.diskResponses,
    required this.systemResponses,
  });

  @override
  Future<DiskInfo> getDiskInfo() async {
    diskCalls++;
    return diskResponses[diskCalls - 1];
  }

  @override
  Future<SystemUsage> getSystemUsage() async {
    systemCalls++;
    return systemResponses[systemCalls - 1];
  }
}
