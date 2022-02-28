import 'package:fmh_mobile/core/model/country_model.dart';
import 'package:fmh_mobile/core/model/product.dart';
import 'package:fmh_mobile/core/network/network_service.dart';
import 'locator/locator.dart';

abstract class Service {
  Future<CountryModelResponse> getCountryList();
  Future<MealModelResponse> getMealList({required String country});
}

class ServiceImpl implements Service {
  final NetworkService _networkService = locator<NetworkServiceImpl>();
  @override
  Future<CountryModelResponse> getCountryList() async =>
      await _networkService.getCountryList();

  @override
  Future<MealModelResponse> getMealList({required String country}) async =>
      await _networkService.getMealList(country: country);
}
