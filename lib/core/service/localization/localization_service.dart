import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/service/locator/locator.dart';
import 'package:fmh_mobile/core/service/service.dart';

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
  final RegExp _replaceArgRegex = RegExp(r'{}');
  final Service _service = locator<ServiceImpl>();

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

  String text(
    String key, {
    List<String>? args,
    Map<String, String>? namedArgs,
  }) {
    return (_localizedValues == null || _localizedValues![key] == null)
        ? '** $key not found'
        : _replaceArgs(
            _replaceNamedArgs(_localizedValues![key], namedArgs), args);
  }

  String _replaceArgs(String res, List<String>? args) {
    if (args == null || args.isEmpty) return res;
    for (var str in args) {
      res = res.replaceFirst(_replaceArgRegex, str);
    }
    return res;
  }

  String _replaceNamedArgs(String res, Map<String, String>? args) {
    if (args == null || args.isEmpty) return res;
    args.forEach((String key, String value) =>
        res = res.replaceAll(RegExp('{$key}'), value));
    return res;
  }

  Future<Null> init([String? language]) async {
    if (_locale == null) {
      try {
        await setNewLanguage(language);
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  Future<Null> setNewLanguage(
      [String? newLanguage, bool saveInPrefs = true]) async {
    String? language = newLanguage;
    language ??= await _service.getPreferredLanguage();
    language ??= supportedLanguagesCodes.first;
    _locale = Locale(language, '');

    final String jsonContent = await rootBundle.loadString(
        '$localizedFilePath$localizedPrefix${locale.languageCode}$localizedFileFormat');
    _localizedValues = json.decode(jsonContent);

    // set deploy country based on language
    setDeployCountry(language);

    if (saveInPrefs) {
      await _service.setPreferredLanguage(language);
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
}

LocalizationService localizationService = LocalizationService();
