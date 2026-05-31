import 'dart:io';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:updat/updat.dart';

import '../../../../services/app_update_service.dart';

class DesktopUpdateChip extends StatefulWidget {
  const DesktopUpdateChip({super.key});

  @override
  State<DesktopUpdateChip> createState() => _DesktopUpdateChipState();
}

class _DesktopUpdateChipState extends State<DesktopUpdateChip> {
  final AppUpdateService _updateService = AppUpdateService();
  late final Future<String> _currentVersionFuture;

  @override
  void initState() {
    super.initState();
    _currentVersionFuture = _loadCurrentVersion();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isDesktop) {
      return const SizedBox.shrink();
    }

    return FutureBuilder<String>(
      future: _currentVersionFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(
            height: 28,
            child: Center(
              child: SizedBox(
                width: 14,
                height: 14,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
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
                return _UpdateChipButton(
                  status: status,
                  latestVersion: latestVersion,
                  checkForUpdate: checkForUpdate,
                  openDialog: openDialog,
                  startUpdate: startUpdate,
                  launchInstaller: launchInstaller,
                );
              },
        );
      },
    );
  }

  bool get _isDesktop =>
      Platform.isMacOS || Platform.isWindows || Platform.isLinux;

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

class _UpdateChipButton extends StatelessWidget {
  const _UpdateChipButton({
    required this.status,
    required this.latestVersion,
    required this.checkForUpdate,
    required this.openDialog,
    required this.startUpdate,
    required this.launchInstaller,
  });

  final UpdatStatus status;
  final String? latestVersion;
  final void Function() checkForUpdate;
  final void Function() openDialog;
  final void Function() startUpdate;
  final Future<void> Function() launchInstaller;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isBusy =
        status == UpdatStatus.checking || status == UpdatStatus.downloading;
    final isReady = status == UpdatStatus.readyToInstall;
    final isAvailable =
        status == UpdatStatus.available ||
        status == UpdatStatus.availableWithChangelog;
    final hasError = status == UpdatStatus.error;

    final label = switch (status) {
      UpdatStatus.checking => 'Checking updates...',
      UpdatStatus.downloading => 'Downloading update...',
      UpdatStatus.readyToInstall => 'Install update',
      UpdatStatus.available || UpdatStatus.availableWithChangelog =>
        latestVersion == null ? 'Update available' : 'Update $latestVersion',
      UpdatStatus.error => 'Retry update check',
      _ => 'Check updates',
    };

    final onPressed = isBusy
        ? null
        : isReady
        ? launchInstaller
        : isAvailable
        ? openDialog
        : checkForUpdate;

    final style = FilledButton.styleFrom(
      minimumSize: const Size(double.infinity, 28),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
      backgroundColor: hasError
          ? const Color(0xFFD32F2F)
          : isAvailable || isReady
          ? colorScheme.primary
          : const Color(0xFF2B2B2B),
      foregroundColor: Colors.white,
    );

    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: style,
        child: Text(label, overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
