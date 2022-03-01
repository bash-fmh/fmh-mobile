import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/viewmodel/dashboard_vm.dart';
import 'package:fmh_mobile/ui/shared/sf_pro_font_style.dart';
import 'package:fmh_mobile/ui/shared/theme_color.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar(this.ref);
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read<DashboardVM>(vmProvider);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: SafeArea(
        child: Container(
          height: 56,
          decoration: BoxDecoration(
              color: ThemeColor.gray000,
              border:
                  Border(top: BorderSide(color: ThemeColor.white, width: 1))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(viewModel.navButtons.length, (index) {
              final currentNav = viewModel.navButtons[index];
              return Consumer(
                builder: (context, ref, child) {
                  final NavButtonType selectedNav = ref
                      .watch(vmProvider.select((vm) => vm.selectedNavButton));
                  return Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () => viewModel.selectedNavButton =
                            currentNav.navButtonType,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              currentNav.asset,
                              height: 24,
                              width: 24,
                              color: _getColor(
                                  currentNav.navButtonType, selectedNav),
                            ),
                            Text(
                              currentNav.name ?? '',
                              style: SfProStyle.subtitle1.copyWith(
                                  color: _getColor(
                                      currentNav.navButtonType, selectedNav)),
                            )
                          ],
                        ),
                      ));
                },
              );
            }),
          ),
        ),
      ),
    );
  }

  Color _getColor(NavButtonType currentNav, NavButtonType selectedNav) {
    return currentNav == selectedNav ? ThemeColor.sunny500 : ThemeColor.gray600;
  }
}
