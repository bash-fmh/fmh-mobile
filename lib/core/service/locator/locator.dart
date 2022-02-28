import 'package:fmh_mobile/core/network/network_service.dart';
import 'package:fmh_mobile/core/service/sharedpreferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:fmh_mobile/core/network/base_api.dart';
import '../service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ServiceImpl());
  locator.registerLazySingleton(() => NetworkServiceImpl());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => PreferencesServiceImpl());
}
