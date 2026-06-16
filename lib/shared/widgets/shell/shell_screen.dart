import 'package:flutter/material.dart';

import '../../../core/models/nav_item.dart';
import '../../../gen/strings.g.dart';
import 'sidebar/sidebar_widget.dart';
import 'startup_update_checker.dart';

class ShellScreen extends StatelessWidget {
  final NavSection activeSection;
  final Widget child;

  const ShellScreen({
    super.key,
    required this.activeSection,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: Stack(
        children: [
          Row(
            children: [
              SidebarWidget(activeSection: activeSection),
              Expanded(child: child),
            ],
          ),
          const StartupUpdateChecker(),
        ],
      ),
    );
  }
}

class ComingSoonScreen extends StatelessWidget {
  final NavSection section;
  const ComingSoonScreen({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF111111),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.construction_rounded,
              size: 48,
              color: Colors.white24,
            ),
            const SizedBox(height: 16),
            Text(
              section.name,
              style: const TextStyle(color: Colors.white38, fontSize: 20),
            ),
            const SizedBox(height: 6),
            Text(
              context.t.shell.comingSoon,
              style: TextStyle(color: Colors.white24, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
