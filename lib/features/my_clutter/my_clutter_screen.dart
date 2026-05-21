import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/section_themes.dart';
import '../../shared/widgets/scan_results_view.dart';
import '../../shared/widgets/section_landing_layout.dart';
import '../../shared/widgets/glossy_icon_widget.dart';
import 'my_clutter_provider.dart';

class MyClutterScreen extends ConsumerWidget {
  const MyClutterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myClutterProvider);
    final notifier = ref.read(myClutterProvider.notifier);
    final vm = state.vm;
    const theme = SectionThemes.myClutter;

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
        onClean: notifier.clean,
        onRescan: notifier.scan,
      );
    }

    return SectionLandingLayout(
      theme: theme,
      orbShape: OrbShape.blob,
      onScan: notifier.scan,
      isScanning: vm.isScanning,
      extraContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Scan for',
            style: TextStyle(color: Colors.white54, fontSize: 12),
          ),
          const SizedBox(height: 8),
          _TypeSelector(
            active: state.activeType,
            accentColor: theme.accentColor,
            onChanged: notifier.setType,
          ),
          if (vm.error != null) ...[
            const SizedBox(height: 10),
            Text(
              vm.error!,
              style: TextStyle(color: Colors.red.shade300, fontSize: 13),
            ),
          ],
        ],
      ),
    );
  }
}

class _TypeSelector extends StatelessWidget {
  final ClutterType active;
  final Color accentColor;
  final ValueChanged<ClutterType> onChanged;

  const _TypeSelector({
    required this.active,
    required this.accentColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: ClutterType.values.map((type) {
          final isActive = type == active;
          return GestureDetector(
            onTap: () => onChanged(type),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isActive
                    ? accentColor.withOpacity(0.25)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                type == ClutterType.largeFiles ? 'Large Files' : 'Downloads',
                style: TextStyle(
                  color: isActive ? accentColor : Colors.white54,
                  fontSize: 13,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          );
        }).toList(),
      ),
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
