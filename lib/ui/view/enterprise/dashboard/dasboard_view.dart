import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/enterprise/dashboard_vm.dart';
import 'package:fmh_mobile/ui/view/enterprise/apps/apps_view.dart';
import 'package:fmh_mobile/ui/view/enterprise/home/home_view.dart';
import 'package:fmh_mobile/ui/view/enterprise/notification/notification_view.dart';

import '../../base_view.dart';
import 'navigation_bar.dart' as nav;

class DashboardView extends ConsumerStatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        onInitReady: () => ref.read<DashboardVM>(vmProvider).init(this),
        builder: (context) {
          return Consumer(builder: (context, ref, child) {
            return SafeArea(
              top: false,
              child: Scaffold(
                  backgroundColor: ThemeColor.floralWhite,
                  appBar: null,
                  resizeToAvoidBottomInset: false,
                  bottomNavigationBar: nav.NavigationBar(ref),
                  body: _getMainBody()),
            );
          });
        });
  }

  Widget _getMainBody() => TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: ref.read<DashboardVM>(vmProvider).tabController,
          children: <Widget>[
            HomeView(),
            AppsView(),
            NotificationView(),
          ]);
}
