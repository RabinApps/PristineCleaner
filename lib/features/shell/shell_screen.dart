import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/nav_item.dart';
import '../applications/applications_screen.dart';
import '../cleanup/cleanup_screen.dart';
import '../my_clutter/my_clutter_screen.dart';
import '../smart_care/smart_care_screen.dart';
import '../space_lens/space_lens_screen.dart';
import 'sidebar/sidebar_widget.dart';

final activeNavProvider = StateProvider<NavSection>(
  (ref) => NavSection.smartCare,
);

class ShellScreen extends ConsumerWidget {
  const ShellScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeNav = ref.watch(activeNavProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: Row(
        children: [
          SidebarWidget(activeSection: activeNav),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position:
                        Tween<Offset>(
                          begin: const Offset(0, 0.025),
                          end: Offset.zero,
                        ).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOut,
                          ),
                        ),
                    child: child,
                  ),
                );
              },
              child: KeyedSubtree(
                key: ValueKey(activeNav),
                child: _buildScreen(activeNav),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScreen(NavSection section) {
    switch (section) {
      case NavSection.smartCare:
        return const SmartCareScreen();
      case NavSection.cleanup:
        return const CleanupScreen();
      case NavSection.myClutter:
        return const MyClutterScreen();
      case NavSection.spaceLens:
        return const SpaceLensScreen();
      case NavSection.applications:
        return const ApplicationsScreen();
      default:
        return _ComingSoonScreen(section: section);
    }
  }
}

class _ComingSoonScreen extends StatelessWidget {
  final NavSection section;
  const _ComingSoonScreen({required this.section});

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
            const Text(
              'Coming soon',
              style: TextStyle(color: Colors.white24, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
