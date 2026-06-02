import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

import 'app.dart';
import 'bridges/exit_interceptor.dart';
import 'gen/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  const windowOptions = WindowOptions(
    size: Size(1140, 740),
    minimumSize: Size(900, 620),
    center: true,
    title: 'PristineCleaner',
    titleBarStyle: TitleBarStyle.hidden,
    backgroundColor: Color(0xFF111111),
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  final navigatorKey = GlobalKey<NavigatorState>();
  final exitInterceptor = ExitInterceptor(navigatorKey);
  exitInterceptor.initialize();

  runApp(
    TranslationProvider(
      child: ProviderScope(
        child: PristineCleanerApp(navigatorKey: navigatorKey),
      ),
    ),
  );
}
