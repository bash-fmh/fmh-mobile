import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/strings_constant.dart';
import 'package:fmh_mobile/core/viewmodel/startup_vm.dart';
import 'package:fmh_mobile/ui/shared/theme_color.dart';
import '../base_view.dart';

class SplashView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseView(
      onInitReady: () => ref.read<StartupVM>(vmProvider).handleStartUp(context),
      builder: (context) {
        return Scaffold(
          backgroundColor: ThemeColor.black,
          body: Text(
            ConstantStrings.welcome,
          ),
        );
      },
    );
  }
}
