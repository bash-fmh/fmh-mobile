import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fmh_mobile/core/exception/failure.dart';
import 'package:fmh_mobile/core/exception/unauthorized.dart';
import 'package:fmh_mobile/core/model/error_model.dart';
import 'package:fmh_mobile/core/service/locator/locator.dart';
import 'package:fmh_mobile/core/service/service.dart';
import 'base_url.dart';

class Api {
  late Dio dio;
  static const String success = 'success';
  static const String error = 'error';
  static const String appJson = 'application/json';
  static const String authorization = 'Authorization';

  Api() {
    dio = Dio();
    dio.options
      ..headers = {
        HttpHeaders.contentTypeHeader: appJson,
      }
      ..responseType = ResponseType.json;
  }

  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, dynamic>? queryParam, bool authorizedHeader = false}) async {
    try {
      dio.options.baseUrl = baseUrl;
      if (authorizedHeader) await setAuthorizedHeader();
      final Response response =
          await dio.get(endpoint, queryParameters: queryParam);
      return await _processResponse(response);
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> delete(String endpoint,
      {Map<String, dynamic>? queryParam, bool authorizedHeader = false}) async {
    try {
      dio.options.baseUrl = baseUrl;
      if (authorizedHeader) await setAuthorizedHeader();
      final Response response =
          await dio.delete(endpoint, queryParameters: queryParam);
      return await _processResponse(response);
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> post(String endpoint,
      {Map<String, dynamic>? queryParam,
      Map<String, dynamic>? body,
      bool authorizedHeader = false,
      FormData? formData,
      ProgressCallback? onSendProgress}) async {
    try {
      dio.options.baseUrl = baseUrl;
      if (authorizedHeader) await setAuthorizedHeader();
      final Response response = await dio.post(endpoint,
          queryParameters: queryParam,
          data: formData ?? body ?? {},
          onSendProgress: onSendProgress);
      return await _processResponse(response);
    } catch (e) {
      throw e;
    }
  }

  Future<void> setAuthorizedHeader() async {
    final Service _service = locator<ServiceImpl>();
    final token = await _service.getToken();
    if (token?.isNotEmpty ?? false) {
      dio.options.headers[authorization] = token;
    } else {
      throw UnAuthorizedException;
    }
  }

  Future<Map<String, dynamic>> _processResponse(Response response) async {
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw FailureException(ErrorModel(
          message: response.data, code: response.statusCode, type: ''));
    }
  }
}
