import 'package:fmh_mobile/core/constant/strings_constant.dart';
import 'package:fmh_mobile/core/model/country_model.dart';
import 'package:fmh_mobile/core/model/product.dart';
import 'package:fmh_mobile/core/network/network_service.dart';
import 'locator/locator.dart';
import 'sharedpreferences/shared_preferences.dart';

abstract class Service {
  Future<CountryModelResponse> getCountryList();
  Future<MealModelResponse> getMealList({required String country});
  Future<String?> getToken();

  Future<String?> getPreferredLanguage();

  Future<bool> setPreferredLanguage(String lang);

  Future<String?> getApplicationSavedInformation(String name);
}

class ServiceImpl implements Service {
  final NetworkService _networkService = locator<NetworkServiceImpl>();
  final PreferencesService _preferencesService =
      locator<PreferencesServiceImpl>();

  @override
  Future<CountryModelResponse> getCountryList() async =>
      await _networkService.getCountryList();

  @override
  Future<MealModelResponse> getMealList({required String country}) async =>
      await _networkService.getMealList(country: country);

  @override
  Future<String?> getToken() async => await _preferencesService.getString(
        key: ConstantStrings.userToken,
      );
  @override
  Future<String?> getPreferredLanguage() async {
    return getApplicationSavedInformation('${ConstantStrings.language}');
  }

  @override
  Future<bool> setPreferredLanguage(String lang) async {
    return _setApplicationSavedInformation('${ConstantStrings.language}', lang);
  }

  @override
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
