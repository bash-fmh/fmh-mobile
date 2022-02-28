import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/constant/env_config.dart';
import 'package:fmh_mobile/core/service/flavor_manager.dart';
import 'package:fmh_mobile/core/service/system_config.dart';

String get baseUrl =>
    FlavorManager.instance.settings.baseUrl[SystemConfig.instance.appType]!;

Map<AppEnvironment, Map<DeployApplicationType, String>> baseMapUrl = {
  AppEnvironment.dev: {
    DeployApplicationType.enterprise: Env.envBaseUrlEnterprise,
    DeployApplicationType.legacy: Env.envBaseUrlLegacy,
    DeployApplicationType.v2: Env.envBaseUrlV2,
  },
  AppEnvironment.uat: {
    DeployApplicationType.enterprise: Env.envBaseUrlEnterprise,
    DeployApplicationType.legacy: Env.envBaseUrlLegacy,
    DeployApplicationType.v2: Env.envBaseUrlV2,
  },
  AppEnvironment.prod: {
    DeployApplicationType.enterprise: Env.envBaseUrlEnterprise,
    DeployApplicationType.legacy: Env.envBaseUrlLegacy,
    DeployApplicationType.v2: Env.envBaseUrlV2,
  }
};
