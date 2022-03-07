import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/ui/widget/custom_card.dart';
import 'package:fmh_mobile/ui/widget/custom_performance.dart';

class HeaderContent extends StatefulWidget {
  @override
  State<HeaderContent> createState() => _HeaderContentState();
}

class _HeaderContentState extends State<HeaderContent> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final double textSize = 11;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.width > 320 ? 160 : 180,
        child: _getActualContent(textSize),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  CustomCard _getActualContent(double textSize) {
    return CustomCard(
      paddingSize: 0,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: CustomPerformance(
              title: getLocalization.mtdSales(
                args: [
                  '${getLocalization.actual} ',
                  getLocalization.mtdGp,
                  ' ${getLocalization.vs} ',
                ],
              ),
              percentageVal: 30,
              percentageColor: ThemeColor.purple600,
              mtdDesc1: getLocalization.mtdGp,
              mtdDesc2: getLocalization.mtdSales(args: ['', '', '']),
              mtdVal1: 30,
              mtdVal2: 0.00,
              titleSize: textSize,
              descSize: textSize,
            ),
          ),
          Expanded(
            child: CustomPerformance(
              title: getLocalization.monthlyBudget(
                args: [
                  '',
                  getLocalization.mtdSales(args: ['', '', '']),
                  ' ${getLocalization.vs} ',
                ],
              ),
              percentageVal: 50,
              percentageColor: ThemeColor.purple600,
              mtdDesc1: getLocalization.mtdSales(args: ['', '', '']),
              mtdDesc2: getLocalization.monthlyBudget(args: ['', '', '']),
              mtdVal1: 50,
              mtdVal2: 0.00,
              descSize: textSize,
              titleSize: textSize,
            ),
          ),
        ],
      ),
    );
  }
}
