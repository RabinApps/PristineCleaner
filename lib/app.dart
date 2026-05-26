import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/l10n/locale_provider.dart';
import 'core/models/nav_item.dart';
import 'core/theme/app_theme.dart';
import 'gen/strings.g.dart';
import 'screens/applications_screen.dart';
import 'screens/cleanup_screen.dart';
import 'screens/my_tools_screen.dart';
import 'screens/my_clutter_screen.dart';
import 'screens/home_screen.dart';
import 'screens/space_view_screen.dart';
import 'shared/widgets/shell/shell_screen.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/home',
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
          path: '/home',
          pageBuilder: (context, state) =>
              _fadePage(state: state, child: const HomeScreen()),
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
          path: '/space-view',
          pageBuilder: (context, state) =>
              _fadePage(state: state, child: const SpaceViewScreen()),
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
    case '/home':
      return NavSection.home;
    case '/cleanup':
      return NavSection.cleanup;
    case '/my-clutter':
      return NavSection.myClutter;
    case '/space-view':
      return NavSection.spaceView;
    case '/applications':
      return NavSection.applications;
    case '/my-tools':
      return NavSection.myTools;
    default:
      return NavSection.home;
  }
}

class PristineCleanerApp extends ConsumerWidget {
  const PristineCleanerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocale = ref.watch(appLocaleProvider);

    return MaterialApp.router(
      title: t.app.title,
      debugShowCheckedModeBanner: false,
      locale: appLocale.flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
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
