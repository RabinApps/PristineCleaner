import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/core/models/file_item.dart';
import 'package:pristine_cleaner/core/models/removal_models.dart';
import 'package:pristine_cleaner/core/models/scan_result.dart';
import 'package:pristine_cleaner/services/my_tools_service.dart';

void main() {
  group('MyToolsService helpers', () {
    final service = MyToolsService();

    test('extractSnapshotId parses Time Machine identifiers', () {
      expect(
        service.extractSnapshotId(
          'com.apple.TimeMachine.2024-01-02-030405.local',
        ),
        '2024-01-02-030405.local',
      );
      expect(service.extractSnapshotId('2024-01-02-030405'), '2024-01-02-030405');
    });

    test('extractSnapshotId ignores unrelated lines', () {
      expect(service.extractSnapshotId('Snapshots for volume group disk1:'),
          isNull);
      expect(service.extractSnapshotId(''), isNull);
      expect(service.extractSnapshotId('not-a-snapshot'), isNull);
    });

    test('basename returns the final path segment', () {
      expect(service.basename('/Users/alex/Downloads/file.dmg'), 'file.dmg');
      expect(service.basename('/Users/alex/Downloads/'), 'Downloads');
      expect(service.basename('solo'), 'solo');
    });
  });

  group('MyToolsService Time Machine', () {
    test('deleting an empty snapshot list yields an empty outcome', () async {
      final service = MyToolsService();
      final outcome = await service.deleteTimeMachineSnapshotsTracked(
        const <FileItem>[],
      );
      expect(outcome, isA<RemovalOutcome>());
      expect(outcome.deletedCount, 0);
      expect(outcome.errors, isEmpty);
    });
  });

  group('MyToolsService scans', () {
    // Bounded, non-recursive scan over a handful of known directories; fast
    // and safe to run on any host without driving Finder/AppleScript.
    test(
      'scanBackgroundItems returns a ScanResult',
      () async {
        final service = MyToolsService();
        final result = await service.scanBackgroundItems();
        expect(result, isA<ScanResult>());
        expect(result.items, isA<List<FileItem>>());
        expect(result.totalBytes, greaterThanOrEqualTo(0));
      },
      timeout: const Timeout(Duration(seconds: 15)),
    );
  });
}
