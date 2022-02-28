import 'package:fmh_mobile/core/constant/enum.dart';

class SystemConfig {
  SystemConfig._();

  static SystemConfig instance = SystemConfig._();

  DeployCountry? _country;

  DeployCountry? get deployCountry => _country ?? DeployCountry.my;

  void setCountry(DeployCountry c) {
    instance._country = c;
  }

  DeployApplicationType? _appType;

  DeployApplicationType? get appType =>
      _appType ?? DeployApplicationType.enterprise;

  void setAppType(DeployApplicationType a) {
    instance._appType = a;
  }
}
