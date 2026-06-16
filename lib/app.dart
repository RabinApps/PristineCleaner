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
import 'screens/donate_screen.dart';
import 'screens/my_tools_screen.dart';
import 'screens/my_clutter_screen.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/space_view_screen.dart';
import 'shared/widgets/shell/shell_screen.dart';

GoRouter _createRouter(GlobalKey<NavigatorState> navigatorKey) {
  return GoRouter(
    navigatorKey: navigatorKey,
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
          GoRoute(
            path: '/donate',
            pageBuilder: (context, state) =>
                _fadePage(state: state, child: const DonateScreen()),
          ),
          GoRoute(
            path: '/settings',
            pageBuilder: (context, state) =>
                _fadePage(state: state, child: const SettingsScreen()),
          ),
        ],
      ),
    ],
  );
}

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
    case '/donate':
      return NavSection.donate;
    case '/settings':
      return NavSection.settings;
    default:
      return NavSection.home;
  }
}

class PristineCleanerApp extends ConsumerStatefulWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const PristineCleanerApp({super.key, this.navigatorKey});

  @override
  ConsumerState<PristineCleanerApp> createState() => _PristineCleanerAppState();
}

class _PristineCleanerAppState extends ConsumerState<PristineCleanerApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    // Created once so locale (or any other) rebuilds don't reset navigation.
    _router = _createRouter(
      widget.navigatorKey ?? GlobalKey<NavigatorState>(),
    );
  }

  @override
  Widget build(BuildContext context) {
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
