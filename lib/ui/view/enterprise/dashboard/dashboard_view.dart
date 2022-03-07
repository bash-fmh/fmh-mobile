import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/enterprise/dashboard_vm.dart';
import 'package:fmh_mobile/ui/widget/loading_screen.dart';

import '../../base_view.dart';
import 'detail_content.dart';
import 'header_content.dart';

class DashboardView extends ConsumerStatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BaseView(
      onInitReady: () => ref.read<DashboardVM>(vmDashboardProvider).loadInit(),
      builder: (BuildContext context) {
        final ViewState state =
            ref.watch(vmDashboardProvider.select((vm) => vm.viewState));

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _renderWidget(state),
        );
      },
    );
  }

  Widget _renderWidget(ViewState state) {
    switch (state) {
      case ViewState.busy:
        return const LoadingScreen();
      default:
        return _getBody();
    }
  }

  Column _getBody() {
    return Column(
      children: <Widget>[
        HeaderContent(),
        Expanded(
          child: Container(
            color: ThemeColor.sunny500,
            child: DetailContent(),
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
