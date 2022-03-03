import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/enterprise/dashboard_vm.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar(this.ref);

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read<DashboardVM>(vmProvider);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: ThemeColor.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: ThemeColor.eliteBlue.withOpacity(0.12),
                    offset: Offset(0, 8),
                    blurRadius: 28,
                    spreadRadius: -6,
                  )
                ],
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    viewModel.navButtons.length,
                    (index) {
                      final currentNav = viewModel.navButtons[index];

                      return Consumer(
                        builder: (context, ref, child) {
                          final NavButtonType selectedNav = ref.watch(
                              vmProvider.select((vm) => vm.selectedNavButton));
                          final bool isNavSelected =
                              currentNav.navButtonType == selectedNav;

                          return Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () => viewModel.selectedNavButton =
                                  currentNav.navButtonType,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(currentNav.asset,
                                      color: _getColor(isNavSelected)),
                                  const SizedBox(height: 5),
                                  Text(
                                    currentNav.name ?? '',
                                    style: GoogleStyle.caption.copyWith(
                                      color: _getColor(isNavSelected),
                                      fontWeight: isNavSelected
                                          ? FontWeight.w700
                                          : FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
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
