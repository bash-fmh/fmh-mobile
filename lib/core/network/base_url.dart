import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/constant/env_config.dart';
import 'package:fmh_mobile/core/service/flavor_manager.dart';
import 'package:fmh_mobile/core/service/system_config.dart';

String get baseUrl =>
    FlavorManager.instance.settings.baseUrl[SystemConfig.instance.appType]!;

Map<AppEnvironment, Map<ApplicationType, String>> baseMapUrl = {
  AppEnvironment.dev: {
    ApplicationType.enterprise: Env.envBaseUrlEnterprise,
    ApplicationType.legacy: Env.envBaseUrlLegacy,
    ApplicationType.v2: Env.envBaseUrlV2,
  },
  AppEnvironment.uat: {
    ApplicationType.enterprise: Env.envBaseUrlEnterprise,
    ApplicationType.legacy: Env.envBaseUrlLegacy,
    ApplicationType.v2: Env.envBaseUrlV2,
  },
  AppEnvironment.prod: {
    ApplicationType.enterprise: Env.envBaseUrlEnterprise,
    ApplicationType.legacy: Env.envBaseUrlLegacy,
    ApplicationType.v2: Env.envBaseUrlV2,
  }
};
