import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/file_item.dart';
import 'package:pristine_cleaner/core/models/removal_models.dart';
import 'package:pristine_cleaner/core/models/scan_result.dart';
import 'package:pristine_cleaner/services/my_tools_service.dart';

void main() {
  group('MyToolsService', () {
    test('scanTrashBins returns a ScanResult', () async {
      final service = MyToolsService();
      final result = await service.scanTrashBins();

      expect(result, isA<ScanResult>());
      expect(result.totalBytes, greaterThanOrEqualTo(0));
    });

    test('scanBackgroundItems returns a ScanResult', () async {
      final service = MyToolsService();
      final result = await service.scanBackgroundItems();

      expect(result, isA<ScanResult>());
      expect(result.items, isA<List<FileItem>>());
    });

    test(
      'time machine snapshot operations complete without throwing',
      () async {
        final service = MyToolsService();

        final scan = await service.scanTimeMachineSnapshots();
        expect(scan, isA<ScanResult>());

        final deleteOutcome = await service.deleteTimeMachineSnapshotsTracked(
          const <FileItem>[],
        );
        expect(deleteOutcome, isA<RemovalOutcome>());
      },
    );
  });
}
