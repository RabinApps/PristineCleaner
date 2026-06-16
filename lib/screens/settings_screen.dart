import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/l10n/locale_provider.dart';
import '../core/settings/settings_provider.dart';
import '../core/theme/section_themes.dart';
import '../gen/strings.g.dart';
import '../shared/widgets/shell/sidebar/desktop_update_chip.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = SectionThemes.settings;
    final tx = context.t.settings;
    final appLocale = ref.watch(appLocaleProvider);
    final settings = ref.watch(settingsProvider);
    final settingsNotifier = ref.read(settingsProvider.notifier);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: theme.backgroundGradient,
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.settings_rounded, size: 56, color: theme.accentColor),
                const SizedBox(height: 16),
                Text(
                  tx.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  tx.subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 32),

                // Language
                _SettingsCard(
                  title: tx.sectionLanguage,
                  accent: theme.accentColor,
                  children: [
                    _SettingsRow(
                      icon: Icons.language_rounded,
                      label: context.t.language.label,
                      trailing: _LanguageDropdown(
                        currentLocale: appLocale,
                        onSelected: (locale) => ref
                            .read(appLocaleProvider.notifier)
                            .setLocale(locale),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Updates
                _SettingsCard(
                  title: tx.sectionUpdates,
                  accent: theme.accentColor,
                  children: [
                    _SwitchRow(
                      label: tx.autoCheckUpdates,
                      sublabel: tx.autoCheckUpdatesSub,
                      value: settings.autoCheckUpdates,
                      accent: theme.accentColor,
                      onChanged: settingsNotifier.setAutoCheckUpdates,
                    ),
                    const Divider(height: 1, color: Colors.white12),
                    _SettingsRow(
                      icon: Icons.system_update_rounded,
                      label: tx.checkForUpdates,
                      trailing: const SizedBox(
                        width: 200,
                        child: DesktopUpdateChip(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Behavior
                _SettingsCard(
                  title: tx.sectionBehavior,
                  accent: theme.accentColor,
                  children: [
                    _SwitchRow(
                      label: tx.launchAtLogin,
                      sublabel: tx.launchAtLoginSub,
                      value: settings.launchAtLogin,
                      accent: theme.accentColor,
                      onChanged: settingsNotifier.setLaunchAtLogin,
                    ),
                    const Divider(height: 1, color: Colors.white12),
                    _SwitchRow(
                      label: tx.confirmBeforeRemoving,
                      sublabel: tx.confirmBeforeRemovingSub,
                      value: settings.confirmBeforeRemoving,
                      accent: theme.accentColor,
                      onChanged: settingsNotifier.setConfirmBeforeRemoving,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  final String title;
  final Color accent;
  final List<Widget> children;

  const _SettingsCard({
    required this.title,
    required this.accent,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                color: accent.withValues(alpha: 0.9),
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
              ),
            ),
          ),
          ...children,
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget trailing;

  const _SettingsRow({
    required this.icon,
    required this.label,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.white.withValues(alpha: 0.6)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}

class _SwitchRow extends StatelessWidget {
  final String label;
  final String sublabel;
  final bool value;
  final Color accent;
  final ValueChanged<bool> onChanged;

  const _SwitchRow({
    required this.label,
    required this.sublabel,
    required this.value,
    required this.accent,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 8, 6),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  sublabel,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.55),
                    fontSize: 12,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Switch(
            value: value,
            activeThumbColor: accent,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class _LanguageDropdown extends StatelessWidget {
  final AppLocale currentLocale;
  final ValueChanged<AppLocale> onSelected;

  const _LanguageDropdown({
    required this.currentLocale,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<AppLocale>(
        value: currentLocale,
        dropdownColor: const Color(0xFF252525),
        style: const TextStyle(color: Colors.white, fontSize: 13),
        iconEnabledColor: Colors.white70,
        items: [
          DropdownMenuItem(
            value: AppLocale.en,
            child: Text(t.language.english),
          ),
          DropdownMenuItem(
            value: AppLocale.es,
            child: Text(t.language.spanish),
          ),
          DropdownMenuItem(
            value: AppLocale.it,
            child: Text(t.language.italian),
          ),
          DropdownMenuItem(
            value: AppLocale.fr,
            child: Text(t.language.french),
          ),
          DropdownMenuItem(
            value: AppLocale.he,
            child: Text(t.language.hebrew),
          ),
          DropdownMenuItem(
            value: AppLocale.el,
            child: Text(t.language.greek),
          ),
          DropdownMenuItem(
            value: AppLocale.pt,
            child: Text(t.language.portuguese),
          ),
          DropdownMenuItem(
            value: AppLocale.zh,
            child: Text(t.language.mandarin),
          ),
        ],
        onChanged: (value) {
          if (value != null) {
            onSelected(value);
          }
        },
      ),
    );
  }
}
