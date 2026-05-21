import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/section_themes.dart';
import '../../shared/widgets/scan_results_view.dart';
import '../../shared/widgets/section_landing_layout.dart';
import 'cleanup_provider.dart';

class CleanupScreen extends ConsumerWidget {
  const CleanupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(cleanupProvider);
    final notifier = ref.read(cleanupProvider.notifier);
    const theme = SectionThemes.cleanup;

    // Done state — show success then reset
    if (vm.isDone) {
      return _DoneScreen(theme: theme, onDismiss: notifier.reset);
    }

    // Results state
    if (vm.hasResults) {
      return ScanResultsView(
        result: vm.result!,
        theme: theme,
        isCleaning: vm.isCleaning,
        onToggleItem: notifier.toggleItem,
        onSelectAll: notifier.selectAll,
        onDeselectAll: notifier.deselectAll,
        onClean: notifier.clean,
        onRescan: notifier.scan,
      );
    }

    // Idle / scanning state
    return SectionLandingLayout(
      theme: theme,
      onScan: notifier.scan,
      onStop: notifier.stop,
      isScanning: vm.isScanning,
      progressPercent: vm.progressPercent,
      extraContent: vm.error != null
          ? Text(
              vm.error!,
              style: TextStyle(color: Colors.red.shade300, fontSize: 13),
            )
          : null,
    );
  }
}

class _DoneScreen extends StatelessWidget {
  final SectionTheme theme;
  final VoidCallback onDismiss;

  const _DoneScreen({required this.theme, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: theme.backgroundGradient,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_rounded,
              size: 72,
              color: theme.accentColor,
            ),
            const SizedBox(height: 20),
            const Text(
              'All cleaned!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Selected files have been moved to Trash.',
              style: TextStyle(color: Colors.white54, fontSize: 15),
            ),
            const SizedBox(height: 32),
            OutlinedButton(
              onPressed: onDismiss,
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.accentColor,
                side: BorderSide(color: theme.accentColor.withOpacity(0.5)),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
