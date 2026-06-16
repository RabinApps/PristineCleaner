/// Immutable user preferences persisted across launches.
///
/// Locale is intentionally excluded — it is owned by `slang` and persisted
/// separately via [LocaleSettings].
class AppSettings {
  final bool autoCheckUpdates;
  final bool launchAtLogin;
  final bool confirmBeforeRemoving;

  const AppSettings({
    this.autoCheckUpdates = true,
    this.launchAtLogin = false,
    this.confirmBeforeRemoving = true,
  });

  AppSettings copyWith({
    bool? autoCheckUpdates,
    bool? launchAtLogin,
    bool? confirmBeforeRemoving,
  }) {
    return AppSettings(
      autoCheckUpdates: autoCheckUpdates ?? this.autoCheckUpdates,
      launchAtLogin: launchAtLogin ?? this.launchAtLogin,
      confirmBeforeRemoving:
          confirmBeforeRemoving ?? this.confirmBeforeRemoving,
    );
  }
}
