import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/constant/strings_constant.dart';
import 'package:fmh_mobile/core/service/locator/locator.dart';
import 'package:fmh_mobile/core/service/sharedpreferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import '../system_config.dart';

class LocalizationService {
  static final LocalizationService _translations =
      LocalizationService._internal();

  factory LocalizationService() {
    return _translations;
  }

  LocalizationService._internal();

  Locale? _locale;
  Map<dynamic, dynamic>? _localizedValues;
  VoidCallback? _onLocaleChangedCallback;

  final PreferencesService _preferencesService =
      locator<PreferencesServiceImpl>();

  static const List<String> supportedLanguages = [
    'English',
    'Bahasa Indonesia',
    'Thailand',
  ];
  static const List<String> supportedLanguagesCodes = [
    'en',
    'id',
    'th',
  ];
  static const String localizedFilePath = 'asset/locale/';
  static const String localizedFileFormat = '.json';
  static const String localizedPrefix = 'localization_';

  String get currentLanguage => _locale == null ? '' : _locale!.languageCode;

  Locale get locale => _locale!;

  set onLocaleChangedCallback(VoidCallback callback) {
    _onLocaleChangedCallback = callback;
  }

  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((lang) => Locale(lang, ''));

  String text(String key) {
    return (_localizedValues == null || _localizedValues![key] == null)
        ? '** $key not found'
        : _localizedValues![key];
  }

  Future<Null> init([String? language]) async {
    if (_locale == null) {
      try {
        await setNewLanguage(language);
      } catch (e, s) {
        return null;
      }
    }
    return null;
  }

  Future<String?> getPreferredLanguage() async {
    return getApplicationSavedInformation('${ConstantStrings.language}');
  }

  Future<bool> setPreferredLanguage(String lang) async {
    return _setApplicationSavedInformation('${ConstantStrings.language}', lang);
  }

  Future<Null> setNewLanguage(
      [String? newLanguage, bool saveInPrefs = true]) async {
    String? language = newLanguage;
    language ??= await getPreferredLanguage();
    language ??= supportedLanguagesCodes.first;
    _locale = Locale(language, '');

    final String jsonContent = await rootBundle.loadString(
        '$localizedFilePath$localizedPrefix${locale.languageCode}$localizedFileFormat');
    _localizedValues = json.decode(jsonContent);

    // set deploy country based on language
    setDeployCountry(language);

    if (saveInPrefs) {
      await setPreferredLanguage(language);
    }
    _onLocaleChangedCallback?.call();
    return null;
  }

  void setDeployCountry(String lang) {
    switch (lang) {
      case 'en':
        SystemConfig.instance.setCountry(DeployCountry.my);
        break;
      case 'th':
        SystemConfig.instance.setCountry(DeployCountry.th);
        break;
      case 'id':
        SystemConfig.instance.setCountry(DeployCountry.id);
        break;
      default:
        SystemConfig.instance.setCountry(DeployCountry.my);
        break;
    }
  }

  Future<String?> getApplicationSavedInformation(String name) async {
    return await _preferencesService.getString(
        key: '${ConstantStrings.storageKey}$name');
  }

  Future<bool> _setApplicationSavedInformation(
      String name, String value) async {
    return _preferencesService.setString(
        key: '${ConstantStrings.storageKey}$name', value: value);
  }
}

LocalizationService localizationService = LocalizationService();
