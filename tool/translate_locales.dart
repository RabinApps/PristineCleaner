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

  final sourceContent = await sourceFile.readAsString();
  final Map<String, dynamic> sourceData = json.decode(sourceContent);

  final targetLocales = [''];

  for (final locale in targetLocales) {
    print('Translating to $locale...');
    final translatedData = await translateMap(sourceData, locale, translator);
    final targetFile = File('assets/translations/$locale.i18n.json');
    await targetFile.writeAsString(
      JsonEncoder.withIndent('  ').convert(translatedData),
    );
    print('Finished $locale');
  }
}

Future<Map<String, dynamic>> translateMap(
  Map<String, dynamic> map,
  String targetLocale,
  GoogleTranslator translator,
) async {
  final result = <String, dynamic>{};
  for (final entry in map.entries) {
    if (entry.value is Map<String, dynamic>) {
      result[entry.key] = await translateMap(
        entry.value as Map<String, dynamic>,
        targetLocale,
        translator,
      );
    } else if (entry.value is String) {
      result[entry.key] = await translateText(
        entry.value as String,
        targetLocale,
        translator,
      );
    } else {
      result[entry.key] = entry.value;
    }
  }
  return result;
}

Future<String> translateText(
  String text,
  String targetLocale,
  GoogleTranslator translator,
) async {
  if (text.isEmpty || text == 'PristineCleaner') return text;

  // Regex to match placeholders like {count}, {bytes}, {name}, etc.
  final placeholderRegex = RegExp(r'\{([^{}]+)\}');
  final placeholders = <String>[];

  // Replace placeholders with non-translatable tokens
  var tempText = text.replaceAllMapped(placeholderRegex, (match) {
    placeholders.add(match.group(0)!);
    return '___PH${placeholders.length - 1}___';
  });

  // Keep PristineCleaner unchanged
  tempText = tempText.replaceAll('PristineCleaner', '___PC___');

  int retries = 0;
  while (retries < 5) {
    try {
      final translation = await translator.translate(
        tempText,
        to: targetLocale,
      );
      var result = translation.text;

      // Restore PristineCleaner
      result = result.replaceAll('___PC___', 'PristineCleaner');

      // Restore placeholders
      for (int i = 0; i < placeholders.length; i++) {
        result = result.replaceAll('___PH${i}___', placeholders[i]);
      }

      // Basic check for common placeholder corruption cases (space after {)
      result = result
          .replaceAll(RegExp(r'\{\s+'), '{')
          .replaceAll(RegExp(r'\s+\}'), '}');

      return result;
    } catch (e) {
      print(
        'Error translating "$text" to $targetLocale: $e. Retrying in ${retries + 1}s...',
      );
      await Future.delayed(Duration(seconds: retries + 1));
      retries++;
    }
  }
  return text; // Fallback to original text after retries
}
