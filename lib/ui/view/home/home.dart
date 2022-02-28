import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/viewmodel/dashboard_vm.dart';
import 'package:fmh_mobile/ui/widget/buttons.dart';
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
            final state = ref.watch(vmProvider.select((vm) => (vm.viewState)));
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
                        bool selected = ref.watch(
                            vmProvider.select((vm) => (vm.selected ?? false)));
                        return CustomButton(
                          key: emailPasswordButtonKey,
                          text: 'Home',
                          onPressed: () =>
                              ref.read<DashboardVM>(vmProvider).setSelected(),
                          textColor: Colors.white,
                          color: selected
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).splashColor,
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('data'),
                    )
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
