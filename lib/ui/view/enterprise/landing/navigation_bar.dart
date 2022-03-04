import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/model/nav_button_model.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/enterprise/landing_vm.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar(this.ref);

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read<LandingVM>(vmLandingProvider);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _getBody(viewModel),
          ],
        ),
      ),
    );
  }

  Container _getBody(LandingVM viewModel) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColor.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: ThemeColor.eliteBlue.withOpacity(0.12),
            offset: const Offset(0, 8),
            blurRadius: 28,
            spreadRadius: -6,
          )
        ],
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      child: _getContent(viewModel),
    );
  }

  Padding _getContent(LandingVM viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          viewModel.navButtons.length,
          (index) {
            final currentNav = viewModel.navButtons[index];

            return Consumer(
              builder: (context, ref, child) {
                final NavButtonType selectedNav =
                    ref.watch(vmLandingProvider.select((vm) => vm.selectedNavButton));
                final bool isNavSelected =
                    currentNav.navButtonType == selectedNav;

                return _getItemContent(viewModel, currentNav, isNavSelected);
              },
            );
          },
        ),
      ),
    );
  }

  Expanded _getItemContent(
      LandingVM viewModel, NavButton currentNav, bool isNavSelected) {
    return Expanded(
      child: InkWell(
        onTap: () => viewModel.selectedNavButton = currentNav.navButtonType,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(currentNav.asset, color: _getColor(isNavSelected)),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                currentNav.name ?? '',
                style: GoogleStyle.caption.copyWith(
                  color: _getColor(isNavSelected),
                  fontWeight: isNavSelected ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor(bool isNavSelected) =>
      isNavSelected ? ThemeColor.sunny500 : ThemeColor.gray600;
}
