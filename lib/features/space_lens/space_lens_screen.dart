import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/file_item.dart';
import '../../core/theme/section_themes.dart';
import '../../core/utils/format_utils.dart';
import '../../shared/widgets/glossy_icon_widget.dart';
import '../../shared/widgets/scan_button.dart';
import 'space_lens_provider.dart';

class SpaceLensScreen extends ConsumerWidget {
  const SpaceLensScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(spaceLensProvider);
    final notifier = ref.read(spaceLensProvider.notifier);
    const theme = SectionThemes.spaceLens;

    if (vm.isDone) {
      return _DoneScreen(theme: theme, onDismiss: notifier.reset);
    }

    if (vm.hasResults) {
      return _SpaceLensResults(
        items: vm.result!.items,
        totalBytes: vm.result!.totalBytes,
        theme: theme,
        isCleaning: vm.isCleaning,
        onToggle: notifier.toggleItem,
        onSelectAll: notifier.selectAll,
        onDeselectAll: notifier.deselectAll,
        onClean: notifier.clean,
        onRescan: notifier.scan,
      );
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: theme.backgroundGradient,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 120),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GlossyIconWidget(
                    baseColor: theme.orbColor,
                    icon: theme.icon,
                    size: 258,
                    shape: OrbShape.squircle,
                  ),
                  const SizedBox(width: 60),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Space Lens',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        theme.subtitle,
                        style: TextStyle(
                          color: Color(0xFFBBBBBB),
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 28),
                      ...theme.features.map(
                        (f) => Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: theme.accentColor.withOpacity(0.18),
                                  border: Border.all(
                                    color: theme.accentColor.withOpacity(0.35),
                                    width: 1,
                                  ),
                                ),
                                child: Icon(
                                  f.icon,
                                  size: 15,
                                  color: theme.accentColor,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                f.label,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (vm.isScanning && vm.progressPercent != null) ...[
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(999),
                                child: LinearProgressIndicator(
                                  value: vm.progressPercent!.clamp(0.0, 1.0),
                                  minHeight: 8,
                                  backgroundColor: Colors.white12,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    theme.accentColor,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                vm.progressLabel ??
                                    '${(vm.progressPercent! * 100).toStringAsFixed(0)}%',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (vm.error != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          vm.error!,
                          style: TextStyle(
                            color: Colors.red.shade300,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 34,
            left: 0,
            right: 0,
            child: Center(
              child: ScanButton(
                color: vm.isScanning ? Colors.redAccent : theme.accentColor,
                label: vm.isScanning ? 'Stop' : 'Scan',
                isLoading: false,
                onPressed: vm.isScanning
                    ? () async {
                        final shouldStop =
                            await showDialog<bool>(
                              context: context,
                              builder: (dialogContext) {
                                return AlertDialog(
                                  backgroundColor: const Color(0xFF191919),
                                  title: const Text(
                                    'Stop scanning?',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  content: const Text(
                                    'This will cancel the current scan and discard any partial progress.',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(
                                        dialogContext,
                                      ).pop(false),
                                      child: const Text('Keep scanning'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () =>
                                          Navigator.of(dialogContext).pop(true),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent,
                                      ),
                                      child: const Text('Stop'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (shouldStop) {
                          notifier.stop();
                        }
                      }
                    : notifier.scan,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SpaceLensResults extends StatelessWidget {
  final List<FileItem> items;
  final int totalBytes;
  final SectionTheme theme;
  final bool isCleaning;
  final ValueChanged<int> onToggle;
  final VoidCallback onSelectAll;
  final VoidCallback onDeselectAll;
  final VoidCallback onClean;
  final VoidCallback onRescan;

  const _SpaceLensResults({
    required this.items,
    required this.totalBytes,
    required this.theme,
    required this.isCleaning,
    required this.onToggle,
    required this.onSelectAll,
    required this.onDeselectAll,
    required this.onClean,
    required this.onRescan,
  });

  @override
  Widget build(BuildContext context) {
    final maxBytes = items.isNotEmpty ? items.first.sizeBytes : 1;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: theme.backgroundGradient,
        ),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
            child: Row(
              children: [
                Text(
                  'Storage map  •  ${formatBytes(totalBytes)} total',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: onSelectAll,
                  icon: Icon(
                    Icons.check_box_rounded,
                    size: 16,
                    color: theme.accentColor,
                  ),
                  label: Text(
                    'Select All',
                    style: TextStyle(color: theme.accentColor, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),

          // Bar chart list
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final ratio = maxBytes > 0 ? item.sizeBytes / maxBytes : 0.0;
                  return _FolderBar(
                    item: item,
                    ratio: ratio,
                    accentColor: theme.accentColor,
                    onTap: () => onToggle(index),
                  );
                },
              ),
            ),
          ),

          // Footer
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              border: Border(
                top: BorderSide(color: Colors.white.withOpacity(0.06)),
              ),
            ),
            child: Row(
              children: [
                Text(
                  '${items.where((i) => i.isSelected).length} folders selected',
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: isCleaning ? null : onRescan,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white60,
                    side: const BorderSide(color: Colors.white24),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Rescan'),
                ),
                const SizedBox(width: 12),
                ScanButton(
                  color: theme.accentColor,
                  label: 'Clean',
                  isLoading: isCleaning,
                  onPressed: (items.every((i) => !i.isSelected) || isCleaning)
                      ? null
                      : onClean,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FolderBar extends StatelessWidget {
  final FileItem item;
  final double ratio;
  final Color accentColor;
  final VoidCallback onTap;

  const _FolderBar({
    required this.item,
    required this.ratio,
    required this.accentColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: item.isSelected
              ? accentColor.withOpacity(0.1)
              : Colors.white.withOpacity(0.04),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: item.isSelected
                ? accentColor.withOpacity(0.3)
                : Colors.transparent,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  value: item.isSelected,
                  onChanged: (_) => onTap(),
                  activeColor: accentColor,
                  side: const BorderSide(color: Colors.white30),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                const SizedBox(width: 6),
                const Icon(Icons.folder_rounded, size: 16, color: Colors.amber),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  item.formattedSize,
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 44),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: LinearProgressIndicator(
                  value: ratio,
                  backgroundColor: Colors.white10,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    accentColor.withOpacity(0.7),
                  ),
                  minHeight: 4,
                ),
              ),
            ),
          ],
        ),
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
              'Cleaned!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
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
