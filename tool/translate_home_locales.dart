import 'dart:convert';
import 'dart:io';

import 'package:translator/translator.dart';

Future<void> main() async {
  final translator = GoogleTranslator();
  final sourceFile = File('assets/translations/en.i18n.json');
  if (!await sourceFile.exists()) {
    print('Source file assets/translations/en.i18n.json not found.');
    return;
  }

  final sourceData =
      json.decode(await sourceFile.readAsString()) as Map<String, dynamic>;
  final translationsDir = Directory('assets/translations');
  if (!await translationsDir.exists()) {
    print('Directory assets/translations not found.');
    return;
  }

  final localeFiles = await translationsDir
      .list()
      .where((entity) => entity is File)
      .cast<File>()
      .where((file) => file.path.endsWith('.i18n.json'))
      .toList();

  for (final file in localeFiles) {
    final locale = _localeFromPath(file.path);
    if (locale == 'en') {
      continue;
    }

    print('Updating home localization for $locale...');
    final targetData =
        json.decode(await file.readAsString()) as Map<String, dynamic>;

    await _translateHomeKeys(
      sourceData: sourceData,
      targetData: targetData,
      targetLocale: locale,
      translator: translator,
    );
    _applyLocaleOverrides(locale, targetData);

    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(targetData),
    );
    print('Updated $locale');
  }

  print('Home localization update complete.');
}

void _applyLocaleOverrides(String locale, Map<String, dynamic> targetData) {
  final targetHome = _ensureMap(targetData, 'home');
  switch (locale.toLowerCase()) {
    case 'fr':
      targetHome['cpuUsage'] = 'Utilisation du CPU';
      targetHome['ramUsage'] = 'Utilisation de la RAM';
      targetHome['memoryPercentUsed'] = '{percent}% de RAM utilisee';
      break;
  }
}

Future<void> _translateHomeKeys({
  required Map<String, dynamic> sourceData,
  required Map<String, dynamic> targetData,
  required String targetLocale,
  required GoogleTranslator translator,
}) async {
  if (targetLocale.toLowerCase() == 'zh' ||
      targetLocale.toLowerCase() == 'cn') {
    _applyChineseHomeTranslations(targetData);
    return;
  }

  final apiLocale = _translatorLocaleCode(targetLocale);

  final sourceNavigation = sourceData['navigation'] as Map<String, dynamic>;
  final sourceSections = sourceData['sections'] as Map<String, dynamic>;
  final sourceHomeSection = sourceSections['home'] as Map<String, dynamic>;
  final sourceHome = sourceData['home'] as Map<String, dynamic>;

  final targetNavigation = _ensureMap(targetData, 'navigation');
  final targetSections = _ensureMap(targetData, 'sections');
  final targetHomeSection = _ensureMap(targetSections, 'home');
  final targetHomeFeatures = _ensureMap(targetHomeSection, 'features');
  final targetHome = _ensureMap(targetData, 'home');

  targetNavigation['home'] = await _translateText(
    sourceNavigation['home'] as String,
    apiLocale,
    translator,
  );

  targetHomeSection['title'] = await _translateText(
    sourceHomeSection['title'] as String,
    apiLocale,
    translator,
  );
  targetHomeSection['subtitle'] = await _translateText(
    sourceHomeSection['subtitle'] as String,
    apiLocale,
    translator,
  );

  final sourceFeatures = sourceHomeSection['features'] as Map<String, dynamic>;
  for (final entry in sourceFeatures.entries) {
    targetHomeFeatures[entry.key] = await _translateText(
      entry.value as String,
      apiLocale,
      translator,
    );
  }

  for (final entry in sourceHome.entries) {
    targetHome[entry.key] = await _translateText(
      entry.value as String,
      apiLocale,
      translator,
    );
  }
}

String _translatorLocaleCode(String locale) {
  switch (locale.toLowerCase()) {
    case 'zh':
    case 'cn':
      return 'zh-cn';
    default:
      return locale;
  }
}

void _applyChineseHomeTranslations(Map<String, dynamic> targetData) {
  final targetNavigation = _ensureMap(targetData, 'navigation');
  final targetSections = _ensureMap(targetData, 'sections');
  final targetHomeSection = _ensureMap(targetSections, 'home');
  final targetHomeFeatures = _ensureMap(targetHomeSection, 'features');
  final targetHome = _ensureMap(targetData, 'home');

  targetNavigation['home'] = '首页';

  targetHomeSection['title'] = '首页';
  targetHomeSection['subtitle'] = '一键获取系统的完整运行状况概览。';
  targetHomeFeatures['systemStatus'] = '系统状态';
  targetHomeFeatures['storageUsage'] = '存储使用情况';
  targetHomeFeatures['quickActions'] = '快速操作';

  targetHome['refresh'] = '刷新';
  targetHome['unableToReadDiskInfo'] = '无法读取磁盘信息';
  targetHome['totalStorage'] = '总存储空间';
  targetHome['used'] = '已使用';
  targetHome['available'] = '可用';
  targetHome['percentUsed'] = '{percent}% 已使用';
  targetHome['cpuUsage'] = 'CPU 使用率';
  targetHome['ramUsage'] = '内存使用率';
  targetHome['memoryPercentUsed'] = '内存已使用 {percent}%';
  targetHome['unableToReadSystemInfo'] = '无法读取系统信息';
}

Map<String, dynamic> _ensureMap(Map<String, dynamic> parent, String key) {
  final existing = parent[key];
  if (existing is Map<String, dynamic>) {
    return existing;
  }
  final created = <String, dynamic>{};
  parent[key] = created;
  return created;
}

String _localeFromPath(String path) {
  final filename = path.split(Platform.pathSeparator).last;
  return filename.replaceFirst('.i18n.json', '');
}

Future<String> _translateText(
  String text,
  String targetLocale,
  GoogleTranslator translator,
) async {
  if (text.isEmpty || text == 'PristineCleaner') {
    return text;
  }

  final placeholderRegex = RegExp(r'\{([^{}]+)\}');
  final placeholders = <String>[];

  var tempText = text.replaceAllMapped(placeholderRegex, (match) {
    placeholders.add(match.group(0)!);
    return '___PH${placeholders.length - 1}___';
  });

  tempText = tempText.replaceAll('PristineCleaner', '___PC___');

  var retries = 0;
  while (retries < 5) {
    try {
      final translation = await translator.translate(
        tempText,
        to: targetLocale,
      );
      var result = translation.text;

      result = result.replaceAll('___PC___', 'PristineCleaner');
      for (var i = 0; i < placeholders.length; i++) {
        result = result.replaceAll('___PH${i}___', placeholders[i]);
      }

      result = result
          .replaceAll(RegExp(r'\{\s+'), '{')
          .replaceAll(RegExp(r'\s+\}'), '}');

      return result;
    } catch (error) {
      retries++;
      print(
        'Error translating "$text" to $targetLocale: $error. Retry $retries/5.',
      );
      await Future<void>.delayed(Duration(seconds: retries));
    }
  }

  return text;
}
