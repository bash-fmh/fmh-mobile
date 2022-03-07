import 'dart:convert';
import 'package:fmh_mobile/core/model/country_model.dart';
import 'package:fmh_mobile/core/network/mock_service/json_data.dart';

class MockJsonProvider {
  static Duration duration = const Duration(seconds: 2);

  Future<CountryModelResponse> getCountryMockJson() {
    return Future.delayed(duration,
        () => CountryModelResponse.fromJson(jsonDecode(mock_country_json)));
  }

  Future<String> getAuthMockJson() {
    return Future.delayed(duration, () => mock_auth_json);
  }
}
