import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:window_manager/window_manager.dart';

import 'app_version_label.dart';
import '../../../../core/models/nav_item.dart';
import '../../../../gen/strings.g.dart';
import '../../../../providers/applications_provider.dart';
import '../../../../providers/cleanup_provider.dart';
import '../../../../providers/my_clutter_provider.dart';
import '../../../../providers/my_tools_provider.dart';
import '../../../../providers/space_view_provider.dart';

class SidebarWidget extends ConsumerWidget {
  final NavSection activeSection;

  const SidebarWidget({super.key, required this.activeSection});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cleanupStatus = ref.watch(
      cleanupProvider.select(
        (vm) => _SidebarScanStatus(
          isScanning: vm.isScanning,
          progress: _normalizedProgress(vm.progressPercent),
        ),
      ),
    );
    final clutterStatus = ref.watch(
      myClutterProvider.select(
        (state) => _SidebarScanStatus(
          isScanning: state.vm.isScanning,
          progress: _normalizedProgress(state.vm.progressPercent),
        ),
      ),
    );
    final spaceViewStatus = ref.watch(
      spaceViewProvider.select(
        (vm) => _SidebarScanStatus(
          isScanning: vm.isScanning,
          progress: _normalizedProgress(vm.progressPercent),
        ),
      ),
    );
    final applicationsStatus = ref.watch(
      applicationsProvider.select(
        (vm) => _SidebarScanStatus(
          isScanning: vm.isScanning,
          progress: _normalizedProgress(vm.progressPercent),
        ),
      ),
    );
    final toolsRunning = ref.watch(
      myToolsProvider.select((state) => state.runningToolIds.isNotEmpty),
    );

    final scanStatuses = <NavSection, _SidebarScanStatus>{
      NavSection.cleanup: cleanupStatus,
      NavSection.myClutter: clutterStatus,
      NavSection.spaceView: spaceViewStatus,
      NavSection.applications: applicationsStatus,
      NavSection.myTools: _SidebarScanStatus(isScanning: toolsRunning),
    };

    return Container(
      width: 218,
      color: const Color(0xFF1A1A1A),
      child: Column(
        children: [
          // Window drag / title bar area
          DragToMoveArea(
            child: Container(
              height: 52,
              padding: const EdgeInsets.only(left: 78, right: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  t.app.title,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.75),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 4),

          // Main nav items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              children: [
                ...NavItem.mainItems().map(
                  (item) => _NavTile(
                    item: item,
                    isActive: item.section == activeSection,
                    scanStatus:
                        scanStatuses[item.section] ??
                        const _SidebarScanStatus(isScanning: false),
                    onTap: () => context.go(_pathForSection(item.section)),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 4),
            child: _NavTile(
              item: NavItem.donateItem(),
              isActive: activeSection == NavSection.donate,
              scanStatus: const _SidebarScanStatus(isScanning: false),
              onTap: () => context.go('/donate'),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
            child: _NavTile(
              item: NavItem.settingsItem(),
              isActive: activeSection == NavSection.settings,
              scanStatus: const _SidebarScanStatus(isScanning: false),
              onTap: () => context.go('/settings'),
            ),
          ),

          // Version label
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: AppVersionLabel(),
          ),
        ],
      ),
    );
  }
}

String _pathForSection(NavSection section) {
  switch (section) {
    case NavSection.home:
      return '/home';
    case NavSection.cleanup:
      return '/cleanup';
    case NavSection.myClutter:
      return '/my-clutter';
    case NavSection.spaceView:
      return '/space-view';
    case NavSection.applications:
      return '/applications';
    case NavSection.myTools:
      return '/my-tools';
    case NavSection.donate:
      return '/donate';
    case NavSection.settings:
      return '/settings';
  }
}

class _NavTile extends StatefulWidget {
  final NavItem item;
  final bool isActive;
  final _SidebarScanStatus scanStatus;
  final VoidCallback onTap;

  const _NavTile({
    required this.item,
    required this.isActive,
    required this.scanStatus,
    required this.onTap,
  });

  @override
  State<_NavTile> createState() => _NavTileState();
}

class _NavTileState extends State<_NavTile> {
  bool _hovered = false;

  Color get _accent =>
      widget.item.theme?.accentColor ?? const Color(0xFF4CAF50);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          margin: const EdgeInsets.symmetric(vertical: 2),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
          decoration: BoxDecoration(
            color: widget.isActive
                ? _accent.withValues(alpha: 0.18)
                : _hovered
                ? Colors.white.withValues(alpha: 0.05)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                widget.item.icon,
                size: 17,
                color: widget.isActive ? _accent : Colors.white54,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.item.label,
                  style: TextStyle(
                    color: widget.isActive ? Colors.white : Colors.white60,
                    fontSize: 13.5,
                    fontWeight: widget.isActive
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                ),
              ),
              _NavIndicator(
                section: widget.item.section,
                isActive: widget.isActive,
                scanStatus: widget.scanStatus,
                accent: _accent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavIndicator extends StatelessWidget {
  final NavSection section;
  final bool isActive;
  final _SidebarScanStatus scanStatus;
  final Color accent;

  const _NavIndicator({
    required this.section,
    required this.isActive,
    required this.scanStatus,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    if (scanStatus.isScanning) {
      return SizedBox(
        width: 10,
        height: 10,
        child: CircularProgressIndicator(
          key: Key('sidebar-scan-${section.name}'),
          value: scanStatus.progress,
          strokeWidth: 1.7,
          color: accent,
        ),
      );
    }

    if (!isActive) {
      return const SizedBox.shrink();
    }

    return Container(
      key: Key('sidebar-active-dot-${section.name}'),
      width: 6,
      height: 6,
      decoration: BoxDecoration(shape: BoxShape.circle, color: accent),
    );
  }
}

class _SidebarScanStatus {
  final bool isScanning;
  final double? progress;

  const _SidebarScanStatus({required this.isScanning, this.progress});
}

double? _normalizedProgress(double? value) {
  if (value == null || value.isNaN || value.isInfinite) {
    return null;
  }
  return value.clamp(0.0, 1.0);
}
