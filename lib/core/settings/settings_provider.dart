import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_settings.dart';

/// Provides the [SharedPreferences] instance loaded during app startup.
///
/// Overridden in `main()` so the [SettingsNotifier] can read synchronously.
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(
    'sharedPreferencesProvider must be overridden in main()',
  );
});

final settingsProvider = NotifierProvider<SettingsNotifier, AppSettings>(
  SettingsNotifier.new,
);

class SettingsNotifier extends Notifier<AppSettings> {
  static const _kAutoCheckUpdates = 'settings.autoCheckUpdates';
  static const _kLaunchAtLogin = 'settings.launchAtLogin';
  static const _kConfirmBeforeRemoving = 'settings.confirmBeforeRemoving';

  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  @override
  AppSettings build() {
    final prefs = _prefs;
    const defaults = AppSettings();
    return AppSettings(
      autoCheckUpdates:
          prefs.getBool(_kAutoCheckUpdates) ?? defaults.autoCheckUpdates,
      launchAtLogin: prefs.getBool(_kLaunchAtLogin) ?? defaults.launchAtLogin,
      confirmBeforeRemoving: prefs.getBool(_kConfirmBeforeRemoving) ??
          defaults.confirmBeforeRemoving,
    );
  }

  Future<void> setAutoCheckUpdates(bool value) async {
    if (value == state.autoCheckUpdates) return;
    state = state.copyWith(autoCheckUpdates: value);
    await _prefs.setBool(_kAutoCheckUpdates, value);
  }

  Future<void> setLaunchAtLogin(bool value) async {
    if (value == state.launchAtLogin) return;
    state = state.copyWith(launchAtLogin: value);
    await _prefs.setBool(_kLaunchAtLogin, value);
    try {
      if (value) {
        await launchAtStartup.enable();
      } else {
        await launchAtStartup.disable();
      }
    } catch (_) {
      // launch_at_startup can be unavailable on some platforms/sandboxes;
      // keep the stored preference regardless so the UI stays consistent.
    }
  }

  Future<void> setConfirmBeforeRemoving(bool value) async {
    if (value == state.confirmBeforeRemoving) return;
    state = state.copyWith(confirmBeforeRemoving: value);
    await _prefs.setBool(_kConfirmBeforeRemoving, value);
  }
}
