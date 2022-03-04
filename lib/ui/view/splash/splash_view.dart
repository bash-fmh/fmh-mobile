import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/enterprise/startup_vm.dart';

import '../base_view.dart';

class SplashView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseView(
      onInitReady: () => ref.read<StartupVM>(vmProvider).handleStartUp(context),
      builder: (context) {
        return const Scaffold(
          backgroundColor: ThemeColor.black,
          body: Text(
            'Welcome',
          ),
        );
      },
    );
  }
}
