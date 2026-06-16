import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:updat/updat.dart';

import '../../../core/settings/settings_provider.dart';
import '../../../services/app_update_service.dart';

/// Invisible widget mounted once at app start (inside the persistent shell).
///
/// When the "check for updates on launch" setting is enabled, it checks GitHub
/// for a newer release and, if one is available, surfaces the standard update
/// dialog. Manual checking lives in the Settings screen via [DesktopUpdateChip].
class StartupUpdateChecker extends ConsumerStatefulWidget {
  const StartupUpdateChecker({super.key});

  @override
  ConsumerState<StartupUpdateChecker> createState() =>
      _StartupUpdateCheckerState();
}

class _StartupUpdateCheckerState extends ConsumerState<StartupUpdateChecker> {
  final AppUpdateService _updateService = AppUpdateService();
  late final Future<String> _currentVersionFuture;
  bool _dialogShown = false;

  @override
  void initState() {
    super.initState();
    _currentVersionFuture = _loadCurrentVersion();
  }

  bool get _isDesktop =>
      Platform.isMacOS || Platform.isWindows || Platform.isLinux;

  @override
  Widget build(BuildContext context) {
    final autoCheck = ref.watch(
      settingsProvider.select((s) => s.autoCheckUpdates),
    );

    if (!autoCheck || !_isDesktop) {
      return const SizedBox.shrink();
    }

    return FutureBuilder<String>(
      future: _currentVersionFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        final currentVersion = snapshot.data!;

        return UpdatWidget(
          currentVersion: currentVersion,
          appName: 'PristineCleaner',
          getLatestVersion: () {
            return _updateService.getLatestVersionForCurrentPlatform(
              currentVersion: currentVersion,
            );
          },
          getBinaryUrl: (latestVersion) {
            return _updateService.getBinaryUrlForCurrentPlatform(
              latestVersion: latestVersion,
            );
          },
          getChangelog: (latestVersion, _) {
            return _updateService.getChangelog(latestVersion: latestVersion);
          },
          openOnDownload: false,
          closeOnInstall: false,
          updateChipBuilder:
              ({
                required BuildContext context,
                required String? latestVersion,
                required String appVersion,
                required UpdatStatus status,
                required void Function() checkForUpdate,
                required void Function() openDialog,
                required void Function() startUpdate,
                required Future<void> Function() launchInstaller,
                required void Function() dismissUpdate,
              }) {
                final isAvailable =
                    status == UpdatStatus.available ||
                    status == UpdatStatus.availableWithChangelog;
                if (isAvailable && !_dialogShown) {
                  _dialogShown = true;
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) openDialog();
                  });
                }
                // Rendered offstage: the dialog is the only visible surface.
                return const SizedBox.shrink();
              },
        );
      },
    );
  }

  Future<String> _loadCurrentVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final version = packageInfo.version.trim();
    if (version.isEmpty) {
      return '0.0.0';
    }

    final build = packageInfo.buildNumber.trim();
    if (build.isEmpty) {
      return version;
    }

    return '$version+$build';
  }
}
