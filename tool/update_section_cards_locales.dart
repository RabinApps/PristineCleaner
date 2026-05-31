import 'dart:convert';
import 'dart:io';

import 'package:translator/translator.dart';

final _cardKeys = <String>[
  'home',
  'cleanup',
  'myClutter',
  'spaceView',
  'applications',
];

Future<void> main() async {
  final sourceFile = File('assets/translations/en.i18n.json');
  if (!await sourceFile.exists()) {
    stderr.writeln('Missing source file: assets/translations/en.i18n.json');
    exitCode = 1;
    return;
  }

  final sourceData =
      json.decode(await sourceFile.readAsString()) as Map<String, dynamic>;
  final sourceSections = sourceData['sections'] as Map<String, dynamic>;

  final translationsDir = Directory('assets/translations');
  final localeFiles =
      await translationsDir
            .list()
            .where((entity) => entity is File)
            .cast<File>()
            .where((file) => file.path.endsWith('.i18n.json'))
            .toList()
        ..sort((a, b) => a.path.compareTo(b.path));

  final translator = GoogleTranslator();

  for (final localeFile in localeFiles) {
    final locale = _localeFromPath(localeFile.path);
    if (locale == 'en') {
      continue;
    }

    stdout.writeln('Updating section cards for $locale...');
    final targetData =
        json.decode(await localeFile.readAsString()) as Map<String, dynamic>;
    final targetSections = _ensureMap(targetData, 'sections');
    final apiLocale = _translatorLocaleCode(locale);

    for (final card in _cardKeys) {
      final sourceCard = sourceSections[card] as Map<String, dynamic>;
      final targetCard = _ensureMap(targetSections, card);

      targetCard['subtitle'] = await _translatePreservingNewlines(
        sourceCard['subtitle'] as String,
        apiLocale,
        translator,
      );

      final sourceFeatures = sourceCard['features'] as Map<String, dynamic>;
      final targetFeatures = _ensureMap(targetCard, 'features');
      for (final entry in sourceFeatures.entries) {
        targetFeatures[entry.key] = await _translatePreservingNewlines(
          entry.value as String,
          apiLocale,
          translator,
        );
      }
    }

    await localeFile.writeAsString(
      const JsonEncoder.withIndent('  ').convert(targetData),
    );
    stdout.writeln('Updated $locale');
  }

  stdout.writeln('Done updating section card locales.');
}

String _localeFromPath(String path) {
  final name = path.split(Platform.pathSeparator).last;
  return name.replaceFirst('.i18n.json', '');
}

String _translatorLocaleCode(String locale) {
  if (locale.toLowerCase() == 'zh') {
    return 'zh-cn';
  }
  return locale;
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

Future<String> _translatePreservingNewlines(
  String text,
  String locale,
  GoogleTranslator translator,
) async {
  if (text.isEmpty || text == 'PristineCleaner') {
    return text;
  }

  final lines = text.split('\n');
  final translatedLines = <String>[];
  for (final line in lines) {
    translatedLines.add(await _translateText(line, locale, translator));
  }
  return translatedLines.join('\n');
}

Future<String> _translateText(
  String text,
  String locale,
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
      final translated = await translator.translate(tempText, to: locale);
      var result = translated.text;

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
      stderr.writeln(
        'Translate failed for "$text" to $locale: $error (retry $retries/5)',
      );
      await Future.delayed(Duration(seconds: retries));
    }
  }

  return text;
}
