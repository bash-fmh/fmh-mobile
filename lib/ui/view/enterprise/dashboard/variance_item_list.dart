import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/constant_asset.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/model/enterprise/mtd_top_model.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/enterprise/dashboard_vm.dart';
import 'package:fmh_mobile/ui/widget/custom_card.dart';

class VarianceItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: CustomCard(
        _getBody(),
      ),
    );
  }

  Column _getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _getButtonSwitchContent(),
        _getContent(),
      ],
    );
  }

  Consumer _getContent() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? widget) {
        final MTDType mtdSelected =
            ref.watch(vmDashboardProvider.select((vm) => vm.mtdSelected));

        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              _getItemTitleContent(mtdSelected),

              /// Table Top List
              _MTDTopList(mtdSelected == MTDType.variance),
            ],
          ),
        );
      },
    );
  }

  Widget _getItemTitleContent(MTDType mtdSelected) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: <Widget>[
          /// Title
          Text(
            mtdSelected == MTDType.variance
                ? getLocalization.topVariance
                : getLocalization.topDiscard,
            style: GoogleStyle.bodyText.copyWith(
              color: ThemeColor.gray900,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const Spacer(),

          /// Sort Down button
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(ConstantAsset.sortDown))
        ],
      ),
    );
  }

  Consumer _getButtonSwitchContent() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final QtyVariance varianceSelected =
            ref.watch(vmDashboardProvider.select((vm) => vm.varianceSelected));

        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /// Cost Switch
              _CustomButton(
                text: getLocalization.cost,
                isSelected: varianceSelected == QtyVariance.cost,
                isReverse: false,
                buttonOnTap: () => ref
                    .read(vmDashboardProvider)
                    .varianceSelected = QtyVariance.cost,
              ),

              /// Qty Switch
              _CustomButton(
                text: getLocalization.qty,
                isSelected: varianceSelected == QtyVariance.qty,
                isReverse: true,
                buttonOnTap: () => ref
                    .read(vmDashboardProvider)
                    .varianceSelected = QtyVariance.qty,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton({
    required this.text,
    required this.isSelected,
    required this.isReverse,
    required this.buttonOnTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isSelected;
  final bool isReverse;
  final VoidCallback buttonOnTap;

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = isReverse
        ? const BorderRadius.horizontal(right: Radius.circular(100))
        : const BorderRadius.horizontal(left: Radius.circular(100));
    final Duration animDuration = const Duration(milliseconds: 250);

    return AnimatedContainer(
      duration: animDuration,
      decoration: BoxDecoration(
          color: isSelected ? ThemeColor.sunny500 : ThemeColor.gray400,
          borderRadius: radius),
      child: _getBody(radius, animDuration),
    );
  }

  Material _getBody(BorderRadius radius, Duration animDuration) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: buttonOnTap,
        borderRadius: radius,
        child: _getContent(animDuration),
      ),
    );
  }

  Padding _getContent(Duration animDuration) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: AnimatedDefaultTextStyle(
        duration: animDuration,
        style: GoogleStyle.bodyText.copyWith(
            color: !isSelected ? ThemeColor.gray500 : ThemeColor.sunny700,
            fontSize: 10),
        child: Text(text),
      ),
    );
  }
}

class _MTDTopList extends ConsumerWidget {
  const _MTDTopList(this.isVariance);

  final bool isVariance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MTDTopModelResponse? mtdList =
        ref.watch(vmDashboardProvider.select((vm) => vm.mtdTopList));

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: mtdList == null ? const SizedBox.shrink() : _getBody(mtdList),
    );
  }

  Table _getBody(MTDTopModelResponse mtdList) {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FractionColumnWidth(.15),
        1: FractionColumnWidth(.6),
        2: FractionColumnWidth(.25)
      },
      children: isVariance
          ? _getVarianceContent(mtdList)
          : _getDiscardContent(mtdList),
    );
  }

  List<TableRow> _getDiscardContent(MTDTopModelResponse mtdList) {
    return List.generate(
      mtdList.mtdDiscard.length,
      (index) {
        final MTDGeneral data = mtdList.mtdDiscard[index];

        return _getTableDetailContent(
          index: index + 1,
          title: data.name,
          value: data.value,
        );
      },
    );
  }

  List<TableRow> _getVarianceContent(MTDTopModelResponse mtdList) {
    return List.generate(
      mtdList.mtdVariance.length,
      (index) {
        final MTDGeneral data = mtdList.mtdVariance[index];

        return _getTableDetailContent(
          index: index + 1,
          title: data.name,
          value: data.value,
        );
      },
    );
  }

  TableRow _getTableDetailContent(
      {required int index, required String title, required double value}) {
    return TableRow(children: <Widget>[
      Text('$index', style: _getTextStyle(), textAlign: TextAlign.left),
      Text(title, style: _getTextStyle(), textAlign: TextAlign.left),
      Text('$value', style: _getTextStyle(), textAlign: TextAlign.right),
    ]);
  }

  TextStyle _getTextStyle() =>
      GoogleStyle.bodyText.copyWith(color: ThemeColor.gray900, fontSize: 13);
}
