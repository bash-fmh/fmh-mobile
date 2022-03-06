import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/enterprise/landing_vm.dart';
import 'package:fmh_mobile/ui/view/enterprise/apps/apps_view.dart';
import 'package:fmh_mobile/ui/view/enterprise/dashboard/dashboard_view.dart';
import 'package:fmh_mobile/ui/view/enterprise/notification/notification_view.dart';

import '../../base_view.dart';
import 'navigation_bar.dart' as nav;

class LandingView extends ConsumerStatefulWidget {
  @override
  _LandingViewState createState() => _LandingViewState();
}

class _LandingViewState extends ConsumerState<LandingView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      onInitReady: () => ref.read<LandingVM>(vmLandingProvider).init(this),
      builder: (context) {
        return Scaffold(
          backgroundColor: ThemeColor.floralWhite,
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: nav.NavigationBar(ref),
          body: _getBody(),
        );
      },
    );
  }

  Widget _getBody() => TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: ref.read<LandingVM>(vmLandingProvider).tabController,
        children: <Widget>[
          DashboardView(),
          AppsView(),
          NotificationView(),
        ],
      );
}
