import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/enterprise/dashboard_vm.dart';
import 'package:fmh_mobile/ui/widget/custom_card.dart';

class MtdPerformance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: CustomCard(
        _getBody(),
      ),
    );
  }

  Consumer _getBody() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final stateSelected =
            ref.watch(vmDashboardProvider.select((vm) => vm.mtdSelected));
        final mtdVarianceSelected = stateSelected == MTDType.variance;
        final mtdTitle = mtdVarianceSelected
            ? getLocalization.mtdVariance
            : getLocalization.mtdDiscard;

        return _getContent(mtdTitle, mtdVarianceSelected);
      },
    );
  }

  Column _getContent(String mtdTitle, bool mtdVarianceSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 12),
          child: Text(
            getLocalization.mtdSalesVs(args: [mtdTitle]),
            style: GoogleStyle.bodyText.copyWith(
                color: ThemeColor.black,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
        ),

        _getPerformancePercentageContent(mtdVarianceSelected),

        /// Variance and Discard Vs Sales Components
        _CustomSales(
          text: mtdTitle,
          mtdValue: mtdVarianceSelected ? 30.00 : 50.00,
          salesValue: 0.00,
        ),
      ],
    );
  }

  Stack _getPerformancePercentageContent(bool mtdVarianceSelected) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        _getCircularGraphContent(mtdVarianceSelected),
        _getPercentageContent(mtdVarianceSelected)
      ],
    );
  }

  Align _getPercentageContent(bool mtdVarianceSelected) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        mtdVarianceSelected ? '30%' : '50%',
        style: GoogleStyle.bodyText
            .copyWith(fontSize: 12, color: ThemeColor.gray900),
      ),
    );
  }

  Center _getCircularGraphContent(bool mtdVarianceSelected) {
    return Center(
      child: Container(
        height: 60,
        width: 60,
        child: CircularProgressIndicator(
          valueColor: const AlwaysStoppedAnimation<Color>(ThemeColor.purple600),
          backgroundColor: ThemeColor.gray400,
          value: mtdVarianceSelected ? 0.3 : 0.5,
          strokeWidth: 5,
        ),
      ),
    );
  }
}

class _CustomSales extends StatelessWidget {
  const _CustomSales({
    required this.text,
    required this.salesValue,
    required this.mtdValue,
    Key? key,
  }) : super(key: key);

  final String text;
  final double salesValue;
  final double mtdValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: _getBody(),
    );
  }

  Table _getBody() {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const <int, TableColumnWidth>{
        0: FractionColumnWidth(.4),
        1: FractionColumnWidth(.03),
        2: FractionColumnWidth(.4)
      },
      children: <TableRow>[
        /// Description
        _getTableDetailContent(text1: text, text2: getLocalization.mtdSales),

        /// Value
        _getTableDetailContent(
          text1: mtdValue.toStringAsFixed(2),
          text2: salesValue.toStringAsFixed(2),
        ),
      ],
    );
  }

  TableRow _getTableDetailContent(
      {required String text1, required String text2}) {
    final performanceStyle =
        GoogleStyle.bodyText.copyWith(color: ThemeColor.gray900, fontSize: 12);

    return TableRow(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            text1,
            textAlign: TextAlign.right,
            style: GoogleStyle.bodyText
                .copyWith(color: ThemeColor.blue600, fontSize: 12),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text('/',
                textAlign: TextAlign.center, style: performanceStyle)),
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(text2, style: performanceStyle),
        ),
      ],
    );
  }
}
