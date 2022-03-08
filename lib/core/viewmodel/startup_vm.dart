import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/service/locator/locator.dart';
import 'package:fmh_mobile/core/service/navigation/nav_router.dart';
import 'package:fmh_mobile/core/service/navigation/navigation_service.dart';
import 'package:fmh_mobile/core/service/service.dart';
import 'package:fmh_mobile/core/service/system_config.dart';

import 'base_viewmodel.dart';

final vmProvider = ChangeNotifierProvider<StartupVM>((_) => StartupVM());

class StartupVM extends BaseViewModel {
  final Service _service = locator<ServiceImpl>();

  Future<void> handleStartUp(BuildContext context) async {
    await _setSysConfig();
    await navigationService.pushAndRemoveUntil(NavRouter.loginRoute);
  }

  Future<void> _setSysConfig() async {
    //load last saved apptype and set to config
    final String? _type = await _service.getAppType();
    SystemConfig.instance.setAppType(ApplicationType.values.firstWhere(
        (type) => describeEnum(type).toLowerCase() == _type?.toLowerCase(),
        orElse: () => ApplicationType.enterprise));

    //check if enterprise and load last saved enterpriseType and set to config
    if (SystemConfig.instance.appType == ApplicationType.enterprise) {
      final String? _enterpriseType = await _service.getEnterpriseType();
      final int index = EnterpriseType.values.indexWhere((type) =>
          describeEnum(type).toLowerCase() == _enterpriseType?.toLowerCase());
      if (index > -1) {
        SystemConfig.instance.setEnterpriseType(EnterpriseType.values[index]);
      }
    }
  }
}
