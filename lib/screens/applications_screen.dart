import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../gen/strings.g.dart';
import '../core/theme/section_themes.dart';
import '../services/trash_service.dart';
import '../shared/removal/removal_flow.dart';
import '../shared/widgets/scan_results_view.dart';
import '../shared/widgets/section_landing_layout.dart';
import '../shared/widgets/glossy_icon_widget.dart';
import '../providers/applications_provider.dart';
import '../core/models/scan_view_model.dart';

class ApplicationsScreen extends ConsumerWidget {
  const ApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(applicationsProvider);
    final notifier = ref.read(applicationsProvider.notifier);
    final theme = SectionThemes.applicationsLocalized(context);

    if (vm.isDone) {
      return _DoneScreen(theme: theme, onDismiss: notifier.reset);
    }

    if (vm.hasResults) {
      return ScanResultsView(
        result: vm.result!,
        theme: theme,
        isCleaning: vm.isCleaning,
        onToggleItem: notifier.toggleItem,
        onSelectAll: notifier.selectAll,
        onDeselectAll: notifier.deselectAll,
        onClean: () {
          unawaited(_handleClean(context, ref, vm, notifier, theme));
        },
        onRescan: notifier.scan,
      );
    }

    return SectionLandingLayout(
      theme: theme,
      orbShape: OrbShape.hexagon,
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
    ApplicationsNotifier notifier,
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
            Text(
              context.t.done.applicationsRemovedTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.t.done.appsMovedToTrashMessage,
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
              child: Text(context.t.buttons.done),
            ),
          ],
        ),
      ),
    );
  }
}
