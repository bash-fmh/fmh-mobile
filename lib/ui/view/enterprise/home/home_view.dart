import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/enterprise/home_vm.dart';

import '../../base_view.dart';
import 'detail_content.dart';
import 'header_content.dart';

class HomeView extends ConsumerStatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BaseView(
        onInitReady: () => ref.read<HomeVM>(vmProvider).loadInit(),
        builder: (BuildContext context) {
          return Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final ViewState state =
                  ref.watch(vmProvider.select((vm) => vm.viewState));

              switch (state) {
                case ViewState.busy:
                  return loadingScreen();
                default:
                  return child ?? const SizedBox.shrink();
              }
            },
            child: Column(
              children: <Widget>[
                Expanded(flex: 25, child: HeaderContent()),
                Expanded(
                  flex: 75,
                  child: Container(
                      color: ThemeColor.sunny500, child: DetailContent()),
                )
              ],
            ),
          );
        });
  }

  Widget loadingScreen() => const Center(
        child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2)),
      );

  @override
  bool get wantKeepAlive => true;
}
