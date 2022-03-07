import 'package:fmh_mobile/core/constant/enum.dart';

class SystemConfig {
  SystemConfig._();

  static SystemConfig instance = SystemConfig._();

  DeployCountry? _country;

  DeployCountry? get deployCountry => _country ?? DeployCountry.my;

  void setCountry(DeployCountry c) {
    instance._country = c;
  }

  ApplicationType? _appType;

  ApplicationType? get appType => _appType ?? ApplicationType.enterprise;

  void setAppType(ApplicationType a) {
    instance._appType = a;
  }

  EnterpriseType? _enterpriseType;

  EnterpriseType? get enterpriseType => _enterpriseType;

  void setEnterpriseType(EnterpriseType? a) {
    instance._enterpriseType = a;
  }
}
