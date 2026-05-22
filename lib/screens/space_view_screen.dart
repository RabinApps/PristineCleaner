import 'dart:math' as math;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';

import '../core/models/file_item.dart';
import '../services/trash_service.dart';
import '../core/theme/section_themes.dart';
import '../core/models/scan_view_model.dart';
import '../shared/removal/removal_flow.dart';
import '../shared/widgets/glossy_icon_widget.dart';
import '../shared/widgets/project_directory_selector.dart';
import '../shared/widgets/scan_button.dart';
import '../providers/space_view_provider.dart';

class SpaceViewScreen extends ConsumerWidget {
  const SpaceViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(spaceViewProvider);
    final notifier = ref.read(spaceViewProvider.notifier);
    const theme = SectionThemes.spaceView;

    if (vm.isDone) {
      return _DoneScreen(theme: theme, onDismiss: notifier.reset);
    }

    final hasWorkspace = vm.result != null;
    if (hasWorkspace) {
      return _SpaceViewWorkspace(
        vm: vm,
        theme: theme,
        onToggle: notifier.toggleItem,
        onOpenFolder: notifier.navigateIntoFolder,
        onOpenBreadcrumb: notifier.navigateToBreadcrumb,
        onSelectAll: notifier.selectAll,
        onDeselectAll: notifier.deselectAll,
        onSetParent: notifier.setParentFolder,
        onRescan: notifier.scan,
        onClean: () {
          unawaited(_handleClean(context, ref, vm, notifier, theme));
        },
      );
    }

    return _SpaceViewStart(
      vm: vm,
      theme: theme,
      onSetParent: notifier.setParentFolder,
      onScan: notifier.scan,
      onStop: notifier.stop,
    );
  }

  Future<void> _handleClean(
    BuildContext context,
    WidgetRef ref,
    ScanViewModel vm,
    SpaceViewNotifier notifier,
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

class _SpaceViewStart extends StatelessWidget {
  final ScanViewModel vm;
  final SectionTheme theme;
  final Future<void> Function(String path) onSetParent;
  final VoidCallback onScan;
  final VoidCallback onStop;

  const _SpaceViewStart({
    required this.vm,
    required this.theme,
    required this.onSetParent,
    required this.onScan,
    required this.onStop,
  });

  Future<void> _pickParentFolder(BuildContext context) async {
    final pickedPath = await _pickNativeDirectory(
      initialDirectory: vm.selectedParentPath,
    );
    if (pickedPath != null && pickedPath.isNotEmpty) {
      await onSetParent(pickedPath);
    }
  }

  Future<void> _handleScanTap(BuildContext context) async {
    if (!vm.isScanning) {
      onScan();
      return;
    }

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
                  onPressed: () => Navigator.of(dialogContext).pop(false),
                  child: const Text('Keep scanning'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(dialogContext).pop(true),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
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
      onStop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final parentPath = vm.selectedParentPath ?? '/';

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
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 86),
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  GlossyIconWidget(
                    baseColor: theme.orbColor,
                    icon: theme.icon,
                    size: 232,
                    shape: OrbShape.squircle,
                  ),
                  const SizedBox(width: 56),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Space View',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.8,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Pick a parent folder, then scan to map what is taking up the most space.',
                          style: TextStyle(
                            color: Color(0xFFBDB6DD),
                            fontSize: 15,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 22),
                        _FeatureTag(
                          icon: Icons.folder_open_rounded,
                          text: 'Default root path is your main hard drive',
                          accentColor: theme.accentColor,
                        ),
                        const SizedBox(height: 10),
                        _FeatureTag(
                          icon: Icons.bubble_chart_rounded,
                          text:
                              'Explore folder sizes through interactive bubbles',
                          accentColor: theme.accentColor,
                        ),
                        const SizedBox(height: 10),
                        _FeatureTag(
                          icon: Icons.ads_click_rounded,
                          text:
                              'Click folders to drill down and inspect deeper',
                          accentColor: theme.accentColor,
                        ),
                        const SizedBox(height: 10),

                        ProjectDirectorySelector(
                          accentColor: theme.accentColor,
                          menuColor: theme.orbColor,
                          selectedPath: parentPath,
                          onPickFolder: () => _pickParentFolder(context),
                        ),
                        if (vm.error != null) ...[
                          const SizedBox(height: 10),
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
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 34,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (vm.isScanning && vm.progressPercent != null)
                  SizedBox(
                    width: 360,
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
                const SizedBox(height: 14),
                ScanButton(
                  color: vm.isScanning ? Colors.redAccent : theme.accentColor,
                  label: vm.isScanning ? 'Stop' : 'Scan',
                  isLoading: false,
                  onPressed: () => _handleScanTap(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SpaceViewWorkspace extends StatefulWidget {
  final ScanViewModel vm;
  final SectionTheme theme;
  final ValueChanged<int> onToggle;
  final ValueChanged<FileItem> onOpenFolder;
  final ValueChanged<int> onOpenBreadcrumb;
  final VoidCallback onSelectAll;
  final VoidCallback onDeselectAll;
  final Future<void> Function(String path) onSetParent;
  final VoidCallback onRescan;
  final VoidCallback onClean;

  const _SpaceViewWorkspace({
    required this.vm,
    required this.theme,
    required this.onToggle,
    required this.onOpenFolder,
    required this.onOpenBreadcrumb,
    required this.onSelectAll,
    required this.onDeselectAll,
    required this.onSetParent,
    required this.onRescan,
    required this.onClean,
  });

  @override
  State<_SpaceViewWorkspace> createState() => _SpaceViewWorkspaceState();
}

class _SpaceViewWorkspaceState extends State<_SpaceViewWorkspace> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<_IndexedItem> _filtered() {
    final items = widget.vm.result?.items ?? const <FileItem>[];
    final indices = List<int>.generate(items.length, (i) => i);

    indices.sort((aIdx, bIdx) {
      final a = items[aIdx];
      final b = items[bIdx];
      return b.sizeBytes.compareTo(a.sizeBytes);
    });

    return [for (final idx in indices) _IndexedItem(idx, items[idx])];
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered();
    final selectedCount =
        (widget.vm.result?.items.where((i) => i.isSelected).length) ?? 0;
    final selectedBytes = widget.vm.result?.selectedBytes ?? 0;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: widget.theme.backgroundGradient,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.22),
              border: Border(
                bottom: BorderSide(color: Colors.white.withOpacity(0.08)),
              ),
            ),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: widget.onRescan,
                  icon: Icon(
                    Icons.refresh_rounded,
                    size: 16,
                    color: widget.theme.accentColor,
                  ),
                  label: Text(
                    'Rescan',
                    style: TextStyle(
                      color: widget.theme.accentColor,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _BreadcrumbBar(
                  paths: widget.vm.breadcrumbs,
                  accentColor: widget.theme.accentColor,
                  onTap: widget.onOpenBreadcrumb,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                children: [
                  SizedBox(
                    width: 370,
                    child: _FolderListPane(
                      accentColor: widget.theme.accentColor,
                      items: filtered,
                      onToggle: widget.onToggle,
                      onOpenFolder: widget.onOpenFolder,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _BubbleCanvas(
                      accentColor: widget.theme.accentColor,
                      items: filtered,
                      onOpenFolder: widget.onOpenFolder,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              border: Border(
                top: BorderSide(color: Colors.white.withOpacity(0.06)),
              ),
            ),
            child: Row(
              children: [
                Text(
                  '$selectedCount items selected',
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(width: 10),
                Text(
                  '|',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  _formatBytes(selectedBytes),
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const Spacer(),
                TextButton(
                  onPressed: widget.onDeselectAll,
                  child: const Text(
                    'Clear Selection',
                    style: TextStyle(color: Colors.white60),
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: widget.onSelectAll,
                  child: Text(
                    'Select All',
                    style: TextStyle(color: widget.theme.accentColor),
                  ),
                ),
                const SizedBox(width: 12),
                ScanButton(
                  color: widget.theme.accentColor,
                  label: 'Clean',
                  isLoading: widget.vm.isCleaning,
                  onPressed: (selectedCount == 0 || widget.vm.isCleaning)
                      ? null
                      : widget.onClean,
                ),
              ],
            ),
          ),
          if (widget.vm.isScanning)
            LinearProgressIndicator(
              minHeight: 2,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(
                widget.theme.accentColor,
              ),
            ),
        ],
      ),
    );
  }
}

class _FolderListPane extends StatelessWidget {
  final Color accentColor;
  final List<_IndexedItem> items;
  final ValueChanged<int> onToggle;
  final ValueChanged<FileItem> onOpenFolder;

  const _FolderListPane({
    required this.accentColor,
    required this.items,
    required this.onToggle,
    required this.onOpenFolder,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
        ),
        child: const Center(
          child: Text(
            'No folders found for this level',
            style: TextStyle(color: Colors.white54),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: items.length,
        separatorBuilder: (_, _) =>
            Divider(height: 1, color: Colors.white.withOpacity(0.05)),
        itemBuilder: (context, idx) {
          final indexed = items[idx];
          final item = indexed.item;
          return ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            onTap: item.isDirectory ? () => onOpenFolder(item) : null,
            leading: Checkbox(
              value: item.isSelected,
              onChanged: (_) => onToggle(indexed.index),
              activeColor: accentColor,
              side: const BorderSide(color: Colors.white30),
            ),
            title: Text(
              item.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              item.formattedSize,
              style: TextStyle(color: accentColor, fontSize: 12),
            ),
            trailing: item.isDirectory
                ? const Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.white54,
                    size: 16,
                  )
                : const Icon(
                    Icons.insert_drive_file_outlined,
                    color: Colors.white54,
                    size: 16,
                  ),
          );
        },
      ),
    );
  }
}

class _BubbleCanvas extends StatelessWidget {
  final Color accentColor;
  final List<_IndexedItem> items;
  final ValueChanged<FileItem> onOpenFolder;

  const _BubbleCanvas({
    required this.accentColor,
    required this.items,
    required this.onOpenFolder,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
        ),
        child: const Center(
          child: Text(
            'No bubbles to render',
            style: TextStyle(color: Colors.white54),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: _StaticBubbleChart(
          accentColor: accentColor,
          items: items,
          onOpenFolder: onOpenFolder,
        ),
      ),
    );
  }
}

class _StaticBubbleChart extends StatelessWidget {
  final Color accentColor;
  final List<_IndexedItem> items;
  final ValueChanged<FileItem> onOpenFolder;

  const _StaticBubbleChart({
    required this.accentColor,
    required this.items,
    required this.onOpenFolder,
  });

  @override
  Widget build(BuildContext context) {
    const maxPrimaryFolders = 8;
    final collisions = <String, int>{};
    final sortedItems = items.map((entry) => entry.item).toList(growable: false)
      ..sort((a, b) => b.sizeBytes.compareTo(a.sizeBytes));

    final folderItems = sortedItems.where((item) => item.isDirectory).toList();
    final source = folderItems.isEmpty ? sortedItems : folderItems;
    final topItems = source.take(maxPrimaryFolders).toList(growable: false);
    final remainingItems = source
        .skip(maxPrimaryFolders)
        .toList(growable: false);
    final bubbles = <_BubbleVisual>[];

    for (final item in topItems) {
      final base = item.name.isEmpty ? 'Untitled' : item.name;
      final count = (collisions[base] ?? 0) + 1;
      collisions[base] = count;
      final bubbleLabel = count == 1 ? base : '$base ($count)';
      bubbles.add(
        _BubbleVisual(
          title: bubbleLabel,
          subtitle: _formatBytes(item.sizeBytes),
          value: item.sizeBytes <= 0 ? 1.0 : item.sizeBytes.toDouble(),
          item: item,
        ),
      );
    }

    if (remainingItems.isNotEmpty) {
      final otherBytes = remainingItems.fold<int>(
        0,
        (sum, item) => sum + item.sizeBytes,
      );
      bubbles.add(
        _BubbleVisual(
          title: 'Other items',
          subtitle: _formatBytes(otherBytes),
          value: otherBytes <= 0 ? 1.0 : otherBytes.toDouble(),
        ),
      );
    }

    if (bubbles.isEmpty) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final sortedByValue = [...bubbles]
          ..sort((a, b) => b.value.compareTo(a.value));
        final placements = _computePlacements(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          bubbles: sortedByValue,
        );

        return Stack(
          children: [
            for (final placement in placements)
              Positioned(
                left: placement.center.dx - (placement.diameter / 2),
                top: placement.center.dy - (placement.diameter / 2),
                child: _StaticBubbleNode(
                  bubble: placement.bubble,
                  accentColor: accentColor,
                  diameter: placement.diameter,
                  onTap:
                      placement.bubble.item != null &&
                          placement.bubble.item!.isDirectory
                      ? () => onOpenFolder(placement.bubble.item!)
                      : null,
                ),
              ),
          ],
        );
      },
    );
  }

  List<_BubblePlacement> _computePlacements({
    required double width,
    required double height,
    required List<_BubbleVisual> bubbles,
  }) {
    final maxValue = bubbles.first.value;
    final minValue = bubbles.last.value;
    final slots = _slotCenters(bubbles.length);
    const rankToSlot = [3, 4, 1, 0, 2, 6, 5, 7, 8, 9];

    final baseDiameters = <double>[];
    for (final bubble in bubbles) {
      final normalized = maxValue == minValue
          ? 0.5
          : (bubble.value - minValue) / (maxValue - minValue);
      baseDiameters.add(84.0 + (normalized * 78.0));
    }

    final baseArea = baseDiameters.fold<double>(
      0,
      (sum, d) => sum + math.pi * math.pow(d / 2, 2),
    );
    final targetArea = (width * height) * 0.50;
    final areaScale = baseArea <= 0
        ? 1.0
        : math.sqrt((targetArea / baseArea).clamp(0.35, 1.0));

    List<_BubblePlacement> last = const [];
    for (var attempt = 0; attempt < 8; attempt++) {
      final attemptScale = areaScale * math.pow(0.93, attempt);
      final diameters = [
        for (final d in baseDiameters) (d * attemptScale).clamp(52.0, 168.0),
      ];

      final centers = <Offset>[];
      for (var i = 0; i < bubbles.length; i++) {
        final slotIndex = i < rankToSlot.length ? rankToSlot[i] : i;
        final raw = slots[slotIndex % slots.length];
        centers.add(Offset(raw.dx * width, raw.dy * height));
      }

      final desiredCenters = List<Offset>.from(centers);
      for (var iter = 0; iter < 160; iter++) {
        for (var i = 0; i < centers.length; i++) {
          for (var j = i + 1; j < centers.length; j++) {
            final dx = centers[j].dx - centers[i].dx;
            final dy = centers[j].dy - centers[i].dy;
            final distance = math.sqrt((dx * dx) + (dy * dy));
            final minDistance = (diameters[i] + diameters[j]) / 2 + 6;
            if (distance >= minDistance) continue;

            final safeDistance = distance < 0.0001 ? 0.0001 : distance;
            final overlap = minDistance - safeDistance;
            final nx = dx / safeDistance;
            final ny = dy / safeDistance;
            final push = overlap * 0.5;

            centers[i] = Offset(
              centers[i].dx - (nx * push),
              centers[i].dy - (ny * push),
            );
            centers[j] = Offset(
              centers[j].dx + (nx * push),
              centers[j].dy + (ny * push),
            );
          }
        }

        for (var i = 0; i < centers.length; i++) {
          final pull = 0.03;
          centers[i] = Offset(
            centers[i].dx + ((desiredCenters[i].dx - centers[i].dx) * pull),
            centers[i].dy + ((desiredCenters[i].dy - centers[i].dy) * pull),
          );

          final radius = diameters[i] / 2;
          final minX = radius;
          final maxX = width - radius;
          final minY = radius;
          final maxY = height - radius;

          centers[i] = Offset(
            centers[i].dx.clamp(minX, maxX),
            centers[i].dy.clamp(minY, maxY),
          );
        }
      }

      last = [
        for (var i = 0; i < bubbles.length; i++)
          _BubblePlacement(
            bubble: bubbles[i],
            center: centers[i],
            diameter: diameters[i],
          ),
      ];

      if (!_hasOverlap(last)) {
        return last;
      }
    }

    return last;
  }

  bool _hasOverlap(List<_BubblePlacement> placements) {
    for (var i = 0; i < placements.length; i++) {
      for (var j = i + 1; j < placements.length; j++) {
        final dx = placements[j].center.dx - placements[i].center.dx;
        final dy = placements[j].center.dy - placements[i].center.dy;
        final distance = math.sqrt((dx * dx) + (dy * dy));
        final minDistance =
            (placements[i].diameter + placements[j].diameter) / 2 + 1;
        if (distance < minDistance) {
          return true;
        }
      }
    }
    return false;
  }

  List<Offset> _slotCenters(int count) {
    final pattern = <Offset>[
      const Offset(0.20, 0.20),
      const Offset(0.50, 0.20),
      const Offset(0.80, 0.20),
      const Offset(0.34, 0.48),
      const Offset(0.66, 0.48),
      const Offset(0.20, 0.77),
      const Offset(0.50, 0.77),
      const Offset(0.80, 0.77),
      const Offset(0.36, 0.32),
      const Offset(0.64, 0.32),
    ];
    if (count <= pattern.length) {
      return pattern;
    }
    return [
      ...pattern,
      for (var i = pattern.length; i < count; i++)
        Offset(0.15 + ((i % 6) * 0.14), 0.15 + ((i ~/ 6) * 0.16)),
    ];
  }
}

class _StaticBubbleNode extends StatelessWidget {
  final _BubbleVisual bubble;
  final Color accentColor;
  final double diameter;
  final VoidCallback? onTap;

  const _StaticBubbleNode({
    required this.bubble,
    required this.accentColor,
    required this.diameter,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = bubble.item?.isSelected == true;
    return InkWell(
      borderRadius: BorderRadius.circular(diameter),
      onTap: onTap,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              accentColor.withOpacity(isSelected ? 0.58 : 0.44),
              accentColor.withOpacity(isSelected ? 0.30 : 0.18),
              const Color(0x40101010),
            ],
            stops: const [0.0, 0.65, 1.0],
          ),
          border: Border.all(
            color: isSelected
                ? accentColor.withOpacity(0.95)
                : accentColor.withOpacity(0.45),
            width: isSelected ? 2.6 : 1.2,
          ),
          boxShadow: [
            BoxShadow(color: accentColor.withOpacity(0.30), blurRadius: 26),
          ],
        ),
        child: Center(
          child: SizedBox(
            width: diameter * 0.72,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  bubble.item?.isDirectory == false
                      ? Icons.insert_drive_file_rounded
                      : Icons.folder_rounded,
                  color: Colors.white.withOpacity(0.86),
                  size: diameter > 140 ? 30 : 24,
                ),
                const SizedBox(height: 7),
                Text(
                  bubble.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: diameter > 140 ? 20 : 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  bubble.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.82),
                    fontSize: diameter > 140 ? 17 : 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BubbleVisual {
  final String title;
  final String subtitle;
  final double value;
  final FileItem? item;

  const _BubbleVisual({
    required this.title,
    required this.subtitle,
    required this.value,
    this.item,
  });
}

class _BubblePlacement {
  final _BubbleVisual bubble;
  final Offset center;
  final double diameter;

  const _BubblePlacement({
    required this.bubble,
    required this.center,
    required this.diameter,
  });
}

class _BreadcrumbBar extends StatelessWidget {
  final List<String> paths;
  final Color accentColor;
  final ValueChanged<int> onTap;

  const _BreadcrumbBar({
    required this.paths,
    required this.accentColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(11),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            for (var i = 0; i < paths.length; i++) ...[
              TextButton(
                onPressed: () => onTap(i),
                child: Text(
                  _pathLabel(paths[i]),
                  style: TextStyle(
                    color: i == paths.length - 1
                        ? Colors.white
                        : Colors.white70,
                    fontWeight: i == paths.length - 1
                        ? FontWeight.w700
                        : FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
              if (i != paths.length - 1)
                Icon(
                  Icons.chevron_right_rounded,
                  color: accentColor.withOpacity(0.7),
                  size: 15,
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _FeatureTag extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color accentColor;

  const _FeatureTag({
    required this.icon,
    required this.text,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: accentColor.withOpacity(0.16),
            border: Border.all(color: accentColor.withOpacity(0.32)),
          ),
          child: Icon(icon, size: 16, color: accentColor),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

Future<String?> _pickNativeDirectory({String? initialDirectory}) {
  return FilePicker.platform.getDirectoryPath(
    dialogTitle: 'Choose parent folder',
    initialDirectory: initialDirectory,
    lockParentWindow: true,
  );
}

class _IndexedItem {
  final int index;
  final FileItem item;

  const _IndexedItem(this.index, this.item);
}

String _pathLabel(String path) {
  if (path == '/' || path == '\\' || path.endsWith(':\\')) {
    return path;
  }

  final normalized = path.replaceAll('\\', '/');
  final parts = normalized.split('/').where((p) => p.isNotEmpty).toList();
  if (parts.isEmpty) return path;
  return parts.last;
}

String _formatBytes(int bytes) {
  const units = ['B', 'KB', 'MB', 'GB', 'TB'];
  double size = bytes.toDouble();
  var unitIndex = 0;
  while (size >= 1024 && unitIndex < units.length - 1) {
    size /= 1024;
    unitIndex++;
  }
  if (unitIndex == 0) {
    return '${size.toStringAsFixed(0)} ${units[unitIndex]}';
  }
  return '${size.toStringAsFixed(1)} ${units[unitIndex]}';
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
