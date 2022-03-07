import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/service/navigation/nav_router.dart';
import 'package:fmh_mobile/core/service/navigation/navigation_service.dart';

import '../base_viewmodel.dart';

final vmProvider = ChangeNotifierProvider<StartupVM>((_) => StartupVM());

class StartupVM extends BaseViewModel {
  Future<void> handleStartUp(BuildContext context) async {
    Future.delayed(const Duration(seconds: 2), () {
      navigationService.pushAndRemoveUntil(NavRouter.dashboardRouter);
    });
  }
}
