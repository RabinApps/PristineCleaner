import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/models/nav_item.dart';
import 'core/theme/app_theme.dart';
import 'features/applications/applications_screen.dart';
import 'features/cleanup/cleanup_screen.dart';
import 'features/my_tools/my_tools_screen.dart';
import 'features/my_clutter/my_clutter_screen.dart';
import 'features/smart_care/smart_care_screen.dart';
import 'features/space_lens/space_lens_screen.dart';
import 'features/shell/shell_screen.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/smart-care',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return ShellScreen(
          activeSection: _sectionFromPath(state.uri.path),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/smart-care',
          pageBuilder: (context, state) =>
              _fadePage(state: state, child: const SmartCareScreen()),
        ),
        GoRoute(
          path: '/cleanup',
          pageBuilder: (context, state) =>
              _fadePage(state: state, child: const CleanupScreen()),
        ),
        GoRoute(
          path: '/my-clutter',
          pageBuilder: (context, state) =>
              _fadePage(state: state, child: const MyClutterScreen()),
        ),
        GoRoute(
          path: '/space-lens',
          pageBuilder: (context, state) =>
              _fadePage(state: state, child: const SpaceLensScreen()),
        ),
        GoRoute(
          path: '/applications',
          pageBuilder: (context, state) =>
              _fadePage(state: state, child: const ApplicationsScreen()),
        ),
        GoRoute(
          path: '/my-tools',
          pageBuilder: (context, state) =>
              _fadePage(state: state, child: const MyToolsScreen()),
        ),
        GoRoute(
          path: '/my-activity',
          pageBuilder: (context, state) => _fadePage(
            state: state,
            child: const ComingSoonScreen(section: NavSection.myActivity),
          ),
        ),
      ],
    ),
  ],
);

CustomTransitionPage<void> _fadePage({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 180),
    reverseTransitionDuration: const Duration(milliseconds: 140),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

NavSection _sectionFromPath(String path) {
  switch (path) {
    case '/smart-care':
      return NavSection.smartCare;
    case '/cleanup':
      return NavSection.cleanup;
    case '/my-clutter':
      return NavSection.myClutter;
    case '/space-lens':
      return NavSection.spaceLens;
    case '/applications':
      return NavSection.applications;
    case '/my-tools':
      return NavSection.myTools;
    case '/my-activity':
      return NavSection.myActivity;
    default:
      return NavSection.smartCare;
  }
}

class PristineCleanerApp extends StatelessWidget {
  const PristineCleanerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PristineCleaner',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme.copyWith(
        scaffoldBackgroundColor: const Color(0xFF111111),
        colorScheme: AppTheme.darkTheme.colorScheme.copyWith(
          primary: const Color(0xFF1E88E5),
          secondary: const Color(0xFF90CAF9),
        ),
      ),
      routerConfig: _router,
    );
  }
}
