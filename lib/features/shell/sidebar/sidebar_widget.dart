import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:window_manager/window_manager.dart';

import '../../../core/models/nav_item.dart';

class SidebarWidget extends StatelessWidget {
  final NavSection activeSection;

  const SidebarWidget({super.key, required this.activeSection});

  @override
  Widget build(BuildContext context) {
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
                  'PristineCleaner',
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
                ...NavItem.mainItems.map(
                  (item) => _NavTile(
                    item: item,
                    isActive: item.section == activeSection,
                    onTap: () => context.go(_pathForSection(item.section)),
                  ),
                ),
                Divider(
                  color: Colors.white.withValues(alpha: 0.08),
                  height: 24,
                  indent: 10,
                  endIndent: 10,
                ),
                ...NavItem.bottomItems.map(
                  (item) => _NavTile(
                    item: item,
                    isActive: item.section == activeSection,
                    onTap: () => context.go(_pathForSection(item.section)),
                  ),
                ),
              ],
            ),
          ),

          // Version label
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Text(
              'v1.0.0',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.2),
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _pathForSection(NavSection section) {
  switch (section) {
    case NavSection.smartCare:
      return '/smart-care';
    case NavSection.cleanup:
      return '/cleanup';
    case NavSection.myClutter:
      return '/my-clutter';
    case NavSection.spaceLens:
      return '/space-lens';
    case NavSection.applications:
      return '/applications';
    case NavSection.myTools:
      return '/my-tools';
    case NavSection.myActivity:
      return '/my-activity';
  }
}

class _NavTile extends StatefulWidget {
  final NavItem item;
  final bool isActive;
  final VoidCallback onTap;

  const _NavTile({
    required this.item,
    required this.isActive,
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
              if (widget.isActive)
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _accent,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
