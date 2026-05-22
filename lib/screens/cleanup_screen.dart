import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/trash_service.dart';
import '../core/theme/section_themes.dart';
import '../shared/removal/removal_flow.dart';
import '../shared/widgets/section_landing_layout.dart';
import '../providers/cleanup_provider.dart';
import '../shared/widgets/cleanup_results_view.dart';
import '../core/models/scan_view_model.dart';

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

    // Results state — new Cleanup Manager layout
    if (vm.hasResults) {
      return CleanupResultsView(
        result: vm.result!,
        theme: theme,
        isCleaning: vm.isCleaning,
        onToggleItem: notifier.toggleItem,
        onToggleGroup: notifier.toggleGroup,
        onToggleCategory: notifier.toggleCategory,
        onSelectAll: notifier.selectAll,
        onDeselectAll: notifier.deselectAll,
        onClean: () {
          unawaited(_handleClean(context, ref, vm, notifier, theme));
        },
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

  Future<void> _handleClean(
    BuildContext context,
    WidgetRef ref,
    ScanViewModel vm,
    CleanupNotifier notifier,
    SectionTheme theme,
  ) async {
    final selected = vm.result?.selectedItems ?? const [];
    if (selected.isEmpty) return;

    final outcome = await runTrashRemovalFlow(
      context: context,
      title: theme.title,
      accentColor: theme.accentColor,
      selectedItems: selected,
      trashService: ref.read(trashServiceProvider),
    );
    if (outcome == null) return;
    notifier.applyRemovalOutcome(outcome);
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
