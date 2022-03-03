import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/viewmodel/dashboard_vm.dart';

import '../base_view.dart';

class HomeView extends StatelessWidget {
  const HomeView(this.ref);
  final WidgetRef ref;
  static const String emailPassword = 'email-password';
  static const Key emailPasswordButtonKey = Key(emailPassword);
  @override
  Widget build(BuildContext context) {
    return BaseView(
      onInitReady: () async => await ref.read<DashboardVM>(vmProvider).onHome(),
      builder: (context) {
        return Center(child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(vmProvider.select((vm) => vm.viewState));
            switch (state) {
              case ViewState.busy:
                return loadingScreen();
              default:
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        final bool selected = ref.watch(
                            vmProvider.select((vm) => vm.selected ?? false));
                        return TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                selected ? Colors.blue : Colors.green),
                          ),
                          onPressed: () =>
                              ref.read<DashboardVM>(vmProvider).setSelected(),
                          child: Text('TextButton'),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Test arg 1:',
                        style: GoogleStyle.subheading,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(getLocalization.testArg1(
                          parm1: 'param2', parm2: 'param2')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Text(
                        'Test arg 2',
                        style: GoogleStyle.subheading,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(getLocalization
                          .testArg2(args: ['Bash', '30', '40', '50'])),
                    ),
                  ],
                );
            }
          },
        ));
      },
    );
  }

  Widget loadingScreen() {
    return const Center(
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}
