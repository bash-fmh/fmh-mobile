import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/enterprise/dashboard_vm.dart';
import 'package:fmh_mobile/ui/view/enterprise/dashboard/mtd_performance.dart';
import 'package:fmh_mobile/ui/view/enterprise/dashboard/variance_item_list.dart';

class DetailContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ThemeColor.floralWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: _getBody(),
    );
  }

  Widget _getBody() {
    return Column(
      children: <Widget>[
        _getButtonSwitchContent(),
        _getContent(),
      ],
    );
  }

  Expanded _getContent() {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: <Widget>[
              MtdPerformance(),
              VarianceItemList(),
            ],
          ),
        ),
      ),
    );
  }

  Consumer _getButtonSwitchContent() {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final MTDType stateSelected =
          ref.watch(vmDashboardProvider.select((vm) => vm.mtdSelected));

      return Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /// MTD Variance
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: _CustomButton(
                text: getLocalization.mtdVariance,
                isSelected: stateSelected == MTDType.variance,
                buttonOnTap: () => ref.read(vmDashboardProvider).mtdSelected =
                    MTDType.variance,
              ),
            ),

            /// MTD Discard
            _CustomButton(
              text: getLocalization.mtdDiscard,
              isSelected: stateSelected == MTDType.discard,
              buttonOnTap: () =>
                  ref.read(vmDashboardProvider).mtdSelected = MTDType.discard,
            ),
          ],
        ),
      );
    });
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton({
    required this.text,
    required this.isSelected,
    required this.buttonOnTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isSelected;
  final VoidCallback buttonOnTap;

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.circular(100);
    const Duration animDuration = Duration(milliseconds: 250);

    return AnimatedContainer(
      duration: animDuration,
      decoration: BoxDecoration(
          color: isSelected ? ThemeColor.sunny500 : null,
          borderRadius: BorderRadius.circular(100)),
      child: _getBody(radius, animDuration),
    );
  }

  Widget _getBody(BorderRadius radius, Duration animDuration) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: buttonOnTap,
        borderRadius: radius,
        child: _getContent(animDuration),
      ),
    );
  }

  Widget _getContent(Duration animDuration) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: AnimatedDefaultTextStyle(
        duration: animDuration,
        style: GoogleStyle.bodyText.copyWith(
            fontSize: 12,
            color: isSelected ? ThemeColor.white : ThemeColor.sunny500),
        child: Text(text),
      ),
    );
  }
}
