import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/viewmodel/dashboard_vm.dart';

import '../base_view.dart';

class SearchView extends StatelessWidget {
  final WidgetRef ref;

  const SearchView(this.ref);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onInitReady: () => ref.read<DashboardVM>(vmProvider).testThrow(),
      didChangeAppLifeCycle: (state) {
        if (state == AppLifecycleState.resumed) {
          // example check for permission
          // check for notification status
          print('app state is resumed');
        } else if (state == AppLifecycleState.paused) {
          //maybe turn off  flash of camera
          print('app state is paused');
        }
      },
      builder: (context) {
        return Center(
          child: Text('Search'),
        );
      },
    );
  }
}
