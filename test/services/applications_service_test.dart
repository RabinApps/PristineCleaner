import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/services/file_service.dart';

void main() {
  group('app leftovers name matching', () {
    test('normalizes common app bundle and plist names', () {
      expect(normalizeAppNameForMatching('Safari.app'), 'safari');
      expect(normalizeAppNameForMatching('com.apple.Safari.plist'), 'safari');
      expect(normalizeAppNameForMatching('org.mozilla.firefox'), 'firefox');
    });

    test('normalizes names across Windows and Linux style values', () {
      expect(normalizeAppNameForMatching('Google-Chrome'), 'google chrome');
      expect(normalizeAppNameForMatching('Code.desktop'), 'code');
      expect(normalizeAppNameForMatching('My_App.cfg'), 'my app');
    });

    test('drops generic non-app tokens', () {
      expect(normalizeAppNameForMatching('Preferences.plist'), '');
      expect(normalizeAppNameForMatching('Applications'), '');
      expect(normalizeAppNameForMatching(''), '');
    });

    test('builds display names from normalized identifiers', () {
      expect(appDisplayNameFromRaw('com.apple.Safari.plist'), 'Safari');
      expect(appDisplayNameFromRaw('google-chrome'), 'Google Chrome');
    });
  });
}
