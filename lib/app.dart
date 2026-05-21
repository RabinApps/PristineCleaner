import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'features/shell/shell_screen.dart';

class PristineCleanerApp extends ConsumerWidget {
  const PristineCleanerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'PristineCleaner',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme.copyWith(
        scaffoldBackgroundColor: const Color(0xFF111111),
        colorScheme: AppTheme.darkTheme.colorScheme.copyWith(
          primary: const Color(0xFF1E88E5),
          secondary: const Color(0xFF90CAF9),
        ),
      ),
      home: const ShellScreen(),
    );
  }
}
