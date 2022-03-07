import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/enterprise/notification_vm.dart';
import 'package:fmh_mobile/ui/view/base_view.dart';
import 'package:fmh_mobile/ui/view/enterprise/notification/notification_detail_content.dart';
import 'package:fmh_mobile/ui/view/enterprise/notification/notification_header_content.dart';
import 'package:fmh_mobile/ui/widget/loading_screen.dart';

class NotificationView extends ConsumerStatefulWidget {
  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends ConsumerState<NotificationView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BaseView(
      onInitReady: () => ref.read<NotificationVM>(vmNotificationProvider).loadInit(),
      builder: (BuildContext context) {
        final ViewState state =
            ref.watch(vmNotificationProvider.select((vm) => vm.viewState));

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _renderWidget(state),
        );
      }
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
        NotificationHeaderContent(),
        Expanded(
          child: Container(
            color: ThemeColor.sunny500,
            child: NotificationDetailContent(),
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
