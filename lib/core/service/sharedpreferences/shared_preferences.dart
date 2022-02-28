import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/constant/strings_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesService {
  Future<bool> setString({required String key, required String value});
  Future<String?> getString({required String key});
  Future<bool> setBool({required String key, required bool value});
  Future<bool?> getBool({required String key});
  Future<bool> setInt({required String key, required int value});
  Future<int?> getInt({required String key});
  Future<bool> clearSession();
  Future<bool> saveCountrySelection({required DeployCountry country});
  Future<bool> saveLastCountryLoggedIn({required String countryCode});
  Future<String?> getLastCountryLoggedIn();
  Future<DeployCountry> getCountrySelected();
}

class PreferencesServiceImpl implements PreferencesService {
  @override
  Future<bool> setString({required String key, required String value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, value);
  }

  @override
  Future<String?> getString({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<bool> setBool({required String key, required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(key, value);
  }

  @override
  Future<bool?> getBool({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  @override
  Future<bool> setInt({required String key, required int value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, value);
  }

  @override
  Future<int?> getInt({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  /// Clear Session
  @override
  Future<bool> clearSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? languageLocale =
        prefs.getString(ConstantStrings.settingsLanguageLocale);
    // get lastSignedCountry
    final String? _lastSignedCountry = await getLastCountryLoggedIn();
    final bool result = await prefs.clear();
    await prefs.setString(
        ConstantStrings.settingsLanguageLocale, languageLocale ?? '');
    await saveLastCountryLoggedIn(countryCode: _lastSignedCountry ?? '');
    return result;
  }

  @override
  Future<bool> saveCountrySelection({required DeployCountry country}) async {
    return await setString(
        key: ConstantStrings.countrySelected, value: describeEnum(country));
  }

  @override
  Future<bool> saveLastCountryLoggedIn({required String countryCode}) async {
    return await setString(
        key: ConstantStrings.lastCountryLoggedInKey, value: countryCode);
  }

  @override
  Future<String?> getLastCountryLoggedIn() async {
    return await getString(key: ConstantStrings.lastCountryLoggedInKey);
  }

  @override
  Future<DeployCountry> getCountrySelected() async {
    final String? selectedCountry =
        await getString(key: ConstantStrings.countrySelected);
    return DeployCountry.values.firstWhere(
        (element) => describeEnum(element) == selectedCountry,
        orElse: () => DeployCountry.id);
  }
}
