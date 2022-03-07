import 'package:flutter/material.dart';
import 'package:fmh_mobile/core/extension/string_ext.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';

class CustomPerformance extends StatelessWidget {
  const CustomPerformance({
    required this.title,
    required this.percentageVal,
    required this.percentageColor,
    required this.mtdDesc1,
    required this.mtdDesc2,
    required this.mtdVal1,
    required this.mtdVal2,
    required this.descSize,
    required this.titleSize,
    Key? key,
  }) : super(key: key);

  final String title;
  final double percentageVal;
  final Color percentageColor;
  final String mtdDesc1;
  final String mtdDesc2;
  final double mtdVal1;
  final double mtdVal2;
  final double titleSize;
  final double descSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: _getBody(),
    );
  }

  Widget _getBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleStyle.bodyText.copyWith(
                color: ThemeColor.black,
                fontWeight: FontWeight.bold,
                fontSize: titleSize),
          ),
        ),

        _getPerformancePercentageContent(),

        /// Variance and Discard Vs Sales Components
        _CustomSales(
          fontSize: descSize,
          mtdDesc1: mtdDesc1,
          mtdDesc2: mtdDesc2,
          mtdVal1: mtdVal1,
          mtdVal2: mtdVal2,
          textColor: percentageColor,
        ),
      ],
    );
  }

  Stack _getPerformancePercentageContent() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[_getCircularGraphContent(), _getPercentageContent()],
    );
  }

  Align _getPercentageContent() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        '$percentageVal%',
        style:
            GoogleStyle.bodyText.copyWith(fontSize: 12, color: percentageColor),
      ),
    );
  }

  Center _getCircularGraphContent() {
    return Center(
      child: Container(
        height: 60,
        width: 60,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(percentageColor),
          backgroundColor: ThemeColor.gray400,
          value: percentageVal / 100,
          strokeWidth: 5,
        ),
      ),
    );
  }
}

class _CustomSales extends StatelessWidget {
  const _CustomSales({
    required this.mtdDesc2,
    required this.mtdVal1,
    required this.mtdVal2,
    required this.mtdDesc1,
    required this.textColor,
    required this.fontSize,
    Key? key,
  }) : super(key: key);

  final String mtdDesc1;
  final String mtdDesc2;
  final double mtdVal1;
  final double mtdVal2;
  final Color textColor;
  final double fontSize;

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
        0: FractionColumnWidth(.475),
        1: FractionColumnWidth(.05),
        2: FractionColumnWidth(.475)
      },
      children: <TableRow>[
        /// Description
        _getTableDetailContent(
          text1: mtdDesc1,
          text2: mtdDesc2,
        ),

        /// Value
        _getTableDetailContent(
          text1: mtdVal1.toStringAsFixed(2),
          text2: mtdVal2.toStringAsFixed(2),
        ),
      ],
    );
  }

  TableRow _getTableDetailContent(
      {required String text1, required String text2}) {
    final performanceStyle = GoogleStyle.bodyText
        .copyWith(color: ThemeColor.gray900, fontSize: fontSize);

    return TableRow(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            text1.overflow ?? '',
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: GoogleStyle.bodyText
                .copyWith(color: textColor, fontSize: fontSize),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text('/',
                textAlign: TextAlign.center, style: performanceStyle)),
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(text2.overflow ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: performanceStyle),
        ),
      ],
    );
  }
}
