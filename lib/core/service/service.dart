import 'package:flutter/foundation.dart';
import 'package:fmh_mobile/core/constant/dummy_data.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/constant/strings_constant.dart';
import 'package:fmh_mobile/core/model/country_model.dart';
import 'package:fmh_mobile/core/model/enterprise/mtd_top_model.dart';
import 'package:fmh_mobile/core/model/product.dart';
import 'package:fmh_mobile/core/network/mock_service/mock_service_json.dart';
import 'package:fmh_mobile/core/network/network_service.dart';
import 'package:fmh_mobile/core/service/system_config.dart';

import 'locator/locator.dart';
import 'sharedpreferences/shared_preferences.dart';

abstract class Service {
  Future<CountryModelResponse> getCountryList();
  Future<MealModelResponse> getMealList({required String country});
  Future<String?> getToken();
  Future<String?> getPreferredLanguage();
  Future<bool> setPreferredLanguage(String lang);
  Future<String?> getApplicationSavedInformation(String name);
  Future<MTDTopModelResponse> getMTDList();
  Future<String?> getAppType();
  Future<bool> setAppType(ApplicationType type);
  Future<String?> getEnterpriseType();
  Future<bool> setEnterpriseType(EnterpriseType type);
  Future<void> clearEnterpriseType();
}

class ServiceImpl implements Service {
  final NetworkService _networkService = locator<NetworkServiceImpl>();
  final MockJsonProvider _mockJsonProvider = locator<MockJsonProvider>();

  final PreferencesService _preferencesService =
      locator<PreferencesServiceImpl>();

  @override
  Future<CountryModelResponse> getCountryList() async =>
      await _mockJsonProvider.getCountryMockJson();

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

  @override
  Future<MTDTopModelResponse> getMTDList() => Future<MTDTopModelResponse>.value(
      MTDTopModelResponse.fromJson(DummyData.mtdTopList));

  @override
  Future<String?> getAppType() async =>
      await _preferencesService.getString(key: ConstantStrings.appType);

  @override
  Future<bool> setAppType(ApplicationType type) async {
    final bool isSet = await _preferencesService.setString(
        key: ConstantStrings.appType, value: describeEnum(type));
    SystemConfig.instance.setAppType(type);
    return isSet;
  }

  @override
  Future<String?> getEnterpriseType() async =>
      await _preferencesService.getString(key: ConstantStrings.enterpriseType);

  @override
  Future<bool> setEnterpriseType(EnterpriseType type) async {
    final bool isSet = await _preferencesService.setString(
        key: ConstantStrings.enterpriseType, value: describeEnum(type));
    SystemConfig.instance.setEnterpriseType(type);
    return isSet;
  }

  @override
  Future<void> clearEnterpriseType() async =>
      await _preferencesService.remove(key: ConstantStrings.enterpriseType);
}
