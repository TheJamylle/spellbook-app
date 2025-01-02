import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_i18n/utils/prefs_keys.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationManager with ChangeNotifier {
  String languageCode = 'en';

  static const String defaultLanguageCode = "en";

  final Map<String, Map<String, String>> _mapLanguages = {};

  Future<void> setLanguage(String newCode) async {
    await getLanguageFromServer(newCode);
    _saveLanguageCode(newCode);
    languageCode = newCode;
    notifyListeners();
  }

  Future<void> _saveLanguageCode(String newCode) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(PrefsKeys.language, newCode);
  }

  Future<void> loadLanguageCode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? possibleLanguage = preferences.getString(PrefsKeys.language);

    if (possibleLanguage != null) {
      languageCode = possibleLanguage;
    } else {
      languageCode = defaultLanguageCode;
    }

    await getLanguageFromServer(languageCode);

    notifyListeners();
  }

  Future<void> getLanguageFromServer(String newCode) async {
    String url = 'https://gist.githubusercontent.com/TheJamylle/6372282eca5af4565c335d9712df5c12/raw/8e9c5cb0d75f1cb44a5833c88a4982787dab2633/app_$newCode.json';

    http.Response httpResponse = await http.get(Uri.parse(url));
    Map<String, dynamic> response = jsonDecode(httpResponse.body);

    _mapLanguages[newCode] = response.map((key, value) => MapEntry(key, value.toString()));
  }

  String _getSentence(String keySentence) {
    String? sentence = _mapLanguages[languageCode]?[keySentence];
    sentence ??= _mapLanguages[defaultLanguageCode]![keySentence]!;

    return sentence;
  }

  String get clearText => _getSentence('clearButton');
  String get clearBooksText => _getSentence('clearBooksText');
  String get languageText => _getSentence('languageText');
  String get devicePatternOption => _getSentence('defaultDeviceLanguageItem');
  String get homeTitle => _getSentence('homeTitle');
  String get homeEmpty => _getSentence('homeEmpty');
  String get homeEmptyCall => _getSentence('homeEmptyCall');
}