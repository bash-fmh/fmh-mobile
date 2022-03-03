import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/constant_asset.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/model/enterprise/mtd_top_model.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/enterprise/home_vm.dart';
import 'package:fmh_mobile/ui/widget/custom_card.dart';

class VarianceItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final QtyVariance varianceSelected =
                  ref.watch(vmProvider.select((vm) => vm.varianceSelected));

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /// Cost Switch
                  _CustomButton(
                    text: getLocalization.cost,
                    isSelected: varianceSelected == QtyVariance.cost,
                    isReverse: false,
                    buttonOnTap: () => ref.read(vmProvider).varianceSelected =
                        QtyVariance.cost,
                  ),

                  /// Qty Switch
                  _CustomButton(
                    text: getLocalization.qty,
                    isSelected: varianceSelected == QtyVariance.qty,
                    isReverse: true,
                    buttonOnTap: () =>
                        ref.read(vmProvider).varianceSelected = QtyVariance.qty,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 10),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? widget) {
              final MTDType mtdSelected =
                  ref.watch(vmProvider.select((vm) => vm.mtdSelected));

              return Column(
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        mtdSelected == MTDType.variance
                            ? getLocalization.topVariance
                            : getLocalization.topDiscard,
                        style: GoogleStyle.bodyText1.copyWith(
                          color: ThemeColor.gray900,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Image.asset(ConstantAsset.sortDown))
                    ],
                  ),
                  const SizedBox(height: 10),

                  /// Table Top List
                  _MTDTopList(mtdSelected == MTDType.variance),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ],
      ),
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
        ? BorderRadius.horizontal(right: Radius.circular(100))
        : BorderRadius.horizontal(left: Radius.circular(100));
    final Duration animDuration = const Duration(milliseconds: 250);

    return AnimatedContainer(
      duration: animDuration,
      decoration: BoxDecoration(
          color: isSelected ? ThemeColor.sunny500 : ThemeColor.gray400,
          borderRadius: radius),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: buttonOnTap,
          borderRadius: radius,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: AnimatedDefaultTextStyle(
              duration: animDuration,
              style: GoogleStyle.bodyText1.copyWith(
                  color: !isSelected ? ThemeColor.gray500 : ThemeColor.sunny700,
                  fontSize: 10),
              child: Text(text),
            ),
          ),
        ),
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
        ref.watch(vmProvider.select((vm) => vm.mtdTopList));

    return mtdList == null
        ? const SizedBox.shrink()
        : Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.top,
            columnWidths: const <int, TableColumnWidth>{
              0: FractionColumnWidth(.15),
              1: FractionColumnWidth(.6),
              2: FractionColumnWidth(.25)
            },
            children: isVariance
                ? List.generate(
                    mtdList.mtdVariance.length,
                    (index) {
                      final MTDGeneral data = mtdList.mtdVariance[index];

                      return _getTableValue(
                        index: index + 1,
                        title: data.name,
                        value: data.value,
                      );
                    },
                  )
                : List.generate(
                    mtdList.mtdDiscard.length,
                    (index) {
                      final MTDGeneral data = mtdList.mtdDiscard[index];

                      return _getTableValue(
                        index: index + 1,
                        title: data.name,
                        value: data.value,
                      );
                    },
                  ),
          );
  }

  TableRow _getTableValue(
      {required int index, required String title, required double value}) {
    return TableRow(children: <Widget>[
      Text('$index', style: _getTextStyle(), textAlign: TextAlign.left),
      Text(title, style: _getTextStyle(), textAlign: TextAlign.left),
      Text('$value', style: _getTextStyle(), textAlign: TextAlign.right),
    ]);
  }

  TextStyle _getTextStyle() =>
      GoogleStyle.bodyText1.copyWith(color: ThemeColor.gray900, fontSize: 13);
}
