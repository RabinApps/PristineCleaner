import 'dart:ui';

import 'package:flutter/material.dart';

import '../services/scan_manager.dart';
import '../shared/widgets/exit_confirmation_dialog.dart';

/// Wires platform exit requests to a confirmation dialog when a scan is active.
class ExitInterceptor {
  final GlobalKey<NavigatorState> navigatorKey;
  late final AppLifecycleListener _lifecycleListener;
  ExitInterceptor(this.navigatorKey);

  void initialize() {
    _lifecycleListener = AppLifecycleListener(
      onExitRequested: _handleExitRequest,
    );
  }

  Future<AppExitResponse> _handleExitRequest() async {
    // If nothing is scanning, allow immediate exit.
    if (!ScanManager.instance.isScanning.value) {
      return AppExitResponse.exit;
    }

    final context = navigatorKey.currentState?.overlay?.context;
    if (context == null) {
      // Can't show a dialog without context; cancel the exit to be safe.
      return AppExitResponse.cancel;
    }

    final bool shouldQuit =
        await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (c) => const ExitConfirmationDialog(),
        ) ??
        false;

    return shouldQuit ? AppExitResponse.exit : AppExitResponse.cancel;
  }

  void dispose() {
    _lifecycleListener.dispose();
  }
}
