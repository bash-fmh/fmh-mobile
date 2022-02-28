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
}
