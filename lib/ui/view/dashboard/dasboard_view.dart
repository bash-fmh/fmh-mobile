import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/dashboard_vm.dart';
import 'package:fmh_mobile/ui/view/home/home.dart';
import 'package:fmh_mobile/ui/view/profile/profile.dart';
import 'package:fmh_mobile/ui/view/search/search.dart';
import 'package:fmh_mobile/ui/widget/app_bar.dart';

import '../base_view.dart';
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
        return Consumer(
          builder: (context, ref, child) {
            final NavButtonType selectedNav =
                ref.watch(vmProvider.select((vm) => vm.selectedNavButton));
            return SafeArea(
              top: false,
              child: Scaffold(
                appBar: selectedNav == NavButtonType.home ||
                        selectedNav == NavButtonType.search
                    ? getAppBar(
                        centerTitle: true,
                        title: Text(
                          'Food & Delivery',
                          style: GoogleStyle.button,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                        ),
                        backgroundColor: ThemeColor.sunny500)
                    : null,
                resizeToAvoidBottomInset: false,
                bottomNavigationBar: nav.NavigationBar(
                  ref,
                ),
                body: _getMainBody(),
              ),
            );
          },
        );
      },
    );
  }

  Widget _getMainBody() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: ref.read<DashboardVM>(vmProvider).tabController,
      children: <Widget>[
        HomeView(ref),
        SearchView(ref),
        ProfileView(),
      ],
    );
  }
}
