import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:trial/app/translations/app_translations.dart';

void main() {
  group('AppTranslationKey', () {
    test('should return a non-null value for all keys', () {
      expect(AppTranslationKey.unknownError, isNotNull);
      expect(AppTranslationKey.timeoutError, isNotNull);
      expect(AppTranslationKey.noConnectionError, isNotNull);
      expect(AppTranslationKey.unauthorizedError, isNotNull);
      expect(AppTranslationKey.tryAgain, isNotNull);
      expect(AppTranslationKey.identify, isNotNull);
      expect(AppTranslationKey.error, isNotNull);
      expect(AppTranslationKey.successful, isNotNull);
      expect(AppTranslationKey.notMatch, isNotNull);
      expect(AppTranslationKey.noEmpty, isNotNull);
      expect(AppTranslationKey.noRecords, isNotNull);
      expect(AppTranslationKey.pleaseLogin, isNotNull);
      expect(AppTranslationKey.noData, isNotNull);
      expect(AppTranslationKey.enterText, isNotNull);
    });
  });

  group('AppTranslation', () {
    test('should return a non-null value for locale', () {
      expect(AppTranslation.locale, isNotNull);
    });

    test('should return a non-null value for translations', () {
      expect(AppTranslation.translations, isNotNull);
    });

    test('should contain valid translations for all supported languages', () {
      AppTranslation.translations.forEach((languageCode, translations) {
        expect(translations, isNotNull);
        expect(translations.isNotEmpty, isTrue);
        expect(translations.containsKey(AppTranslationKey.unknownError), isTrue);
        expect(translations.containsKey(AppTranslationKey.timeoutError), isTrue);
        expect(translations.containsKey(AppTranslationKey.noConnectionError), isTrue);
        expect(translations.containsKey(AppTranslationKey.unauthorizedError), isTrue);
        expect(translations.containsKey(AppTranslationKey.tryAgain), isTrue);
        expect(translations.containsKey(AppTranslationKey.identify), isTrue);
        expect(translations.containsKey(AppTranslationKey.error), isTrue);
        expect(translations.containsKey(AppTranslationKey.successful), isTrue);
        expect(translations.containsKey(AppTranslationKey.notMatch), isTrue);
        expect(translations.containsKey(AppTranslationKey.noEmpty), isTrue);
        expect(translations.containsKey(AppTranslationKey.noRecords), isTrue);
        expect(translations.containsKey(AppTranslationKey.pleaseLogin), isTrue);
        expect(translations.containsKey(AppTranslationKey.noData), isTrue);
        expect(translations.containsKey(AppTranslationKey.enterText), isTrue);
      });
    });
  });
}
