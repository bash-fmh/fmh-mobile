import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/enterprise/home_vm.dart';
import 'package:fmh_mobile/ui/view/enterprise/home/mtd_performance.dart';
import 'package:fmh_mobile/ui/view/enterprise/home/variance_item_list.dart';

class DetailContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColor.floralWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const SizedBox(height: 10),
              Consumer(builder:
                  (BuildContext context, WidgetRef ref, Widget? child) {
                final MTDType stateSelected =
                    ref.watch(vmProvider.select((vm) => vm.mtdSelected));

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /// MTD Variance
                    _CustomButton(
                      text: getLocalization.mtdVariance,
                      isSelected: stateSelected == MTDType.variance,
                      buttonOnTap: () =>
                          ref.read(vmProvider).mtdSelected = MTDType.variance,
                    ),
                    const SizedBox(width: 10),

                    /// MTD Discard
                    _CustomButton(
                      text: getLocalization.mtdDiscard,
                      isSelected: stateSelected == MTDType.discard,
                      buttonOnTap: () =>
                          ref.read(vmProvider).mtdSelected = MTDType.discard,
                    ),
                  ],
                );
              }),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 5),
                      MtdPerformance(),
                      const SizedBox(height: 15),
                      VarianceItemList(),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: buttonOnTap,
          borderRadius: radius,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: AnimatedDefaultTextStyle(
                duration: animDuration,
                style: GoogleStyle.bodyText.copyWith(
                    fontSize: 12,
                    color: isSelected ? ThemeColor.white : ThemeColor.sunny500),
                child: Text(text)),
          ),
        ),
      ),
    );
  }
}
