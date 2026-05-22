import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../gen/strings.g.dart';

final appLocaleProvider = NotifierProvider<AppLocaleNotifier, AppLocale>(
  AppLocaleNotifier.new,
);

class AppLocaleNotifier extends Notifier<AppLocale> {
  @override
  AppLocale build() {
    return LocaleSettings.currentLocale;
  }

  void setLocale(AppLocale locale) {
    if (locale == state) {
      return;
    }
    state = locale;
    LocaleSettings.setLocale(locale);
  }
}
