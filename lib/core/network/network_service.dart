import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fmh_mobile/core/constant/constant_url.dart';
import 'package:fmh_mobile/core/model/country_model.dart';
import 'package:fmh_mobile/core/model/product.dart';
import 'package:fmh_mobile/core/model/upload_form_data.dart';
import 'package:fmh_mobile/core/service/locator/locator.dart';
import 'base_api.dart';

abstract class NetworkService {
  Future<CountryModelResponse> getCountryList();
  Future<MealModelResponse> getMealList({required String country});

  Future<Map<String, dynamic>> testMultiPartFile(
      {required UploadFormData uploadFormData});
}

class NetworkServiceImpl implements NetworkService {
  final Api _api = locator<Api>();

  @override
  Future<CountryModelResponse> getCountryList() async {
    final Map<String, dynamic> response = await _api.get(
      ConstantUrl.countryList,
      authorizedHeader: false,
    );
    return CountryModelResponse.fromJson(response);
  }

  @override
  Future<MealModelResponse> getMealList({required String country}) async {
    final Map<String, dynamic> response = await _api.get(
      ConstantUrl.mealList(country),
      authorizedHeader: false,
    );
    return MealModelResponse.fromJson(response);
  }

  @override
  Future<Map<String, dynamic>> testMultiPartFile(
      {required UploadFormData uploadFormData}) async {
    return await _api.post("endpoint",
        formData: await uploadFormData.getApiParam());
  }
}
