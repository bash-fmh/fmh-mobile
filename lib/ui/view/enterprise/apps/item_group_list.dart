import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/constant_asset.dart';
import 'package:fmh_mobile/core/extension/string_ext.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/enterprise/apps_vm.dart';

class ItemGroupList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _RequestAndOrders(),
        _StockManagement(),
        _Others(),
      ],
    );
  }
}

class _RequestAndOrders extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _CustomCard(
      title: getLocalization.requestAndOrder,
      itemList: <Widget>[
        _CustomItemCard(
          iconName: ConstantAsset.mainLogoIcon,
          title: getLocalization.placeOrder,
          itemOnTap: ref.read(vmAppsProvider).placeOrder,
        ),
        _CustomItemCard(
          iconName: ConstantAsset.mainLogoIcon,
          title: getLocalization.receiving,
          itemOnTap: ref.read(vmAppsProvider).receiving,
        ),
        _CustomItemCard(
          iconName: ConstantAsset.mainLogoIcon,
          title: getLocalization.creditNote,
          itemOnTap: ref.read(vmAppsProvider).creditNote,
        ),
      ],
    );
  }
}

class _StockManagement extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _CustomCard(
      title: getLocalization.stockManagement,
      itemList: <Widget>[
        _CustomItemCard(
          iconName: ConstantAsset.mainLogoIcon,
          title: getLocalization.stockCount,
          itemOnTap: ref.read(vmAppsProvider).stockCount,
        ),
        _CustomItemCard(
          iconName: ConstantAsset.mainLogoIcon,
          title: getLocalization.discard,
          itemOnTap: ref.read(vmAppsProvider).discard,
        ),
        _CustomItemCard(
          iconName: ConstantAsset.mainLogoIcon,
          title: getLocalization.transfer,
          itemOnTap: ref.read(vmAppsProvider).transfer,
        ),
      ],
    );
  }
}

class _Others extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _CustomCard(
      title: getLocalization.others,
      itemList: <Widget>[
        _CustomItemCard(
          iconName: ConstantAsset.mainLogoIcon,
          title: getLocalization.oilControl,
          itemOnTap: ref.read(vmAppsProvider).oilControl,
        ),
        _CustomItemCard(
          iconName: ConstantAsset.mainLogoIcon,
          title: getLocalization.sAndDCost,
          itemOnTap: ref.read(vmAppsProvider).sdCost,
        ),
        _CustomItemCard(
          iconName: ConstantAsset.mainLogoIcon,
          title: getLocalization.parVariant,
          itemOnTap: ref.read(vmAppsProvider).parVariant,
        ),
        _CustomItemCard(
          iconName: ConstantAsset.mainLogoIcon,
          title: getLocalization.settings,
          itemOnTap: ref.read(vmAppsProvider).settings,
        )
      ],
    );
  }
}

class _CustomCard extends StatelessWidget {
  const _CustomCard({required this.itemList, required this.title, Key? key})
      : super(key: key);

  final List<Widget> itemList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColor.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ThemeColor.eliteBlue.withOpacity(0.12),
              offset: const Offset(0, 8),
              blurRadius: 28,
              spreadRadius: -6,
            )
          ],
        ),
        child: _getBody(),
      ),
    );
  }

  Column _getBody() {
    return Column(
      children: <Widget>[_getTitle(), _getContent()],
    );
  }

  GridView _getContent() {
    return GridView(
      padding: const EdgeInsets.all(15),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 15,
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        // childAspectRatio: 0.5,
      ),
      children: itemList,
    );
  }

  Container _getTitle() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: ThemeColor.sunny300,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      child: _getTitleContent(),
    );
  }

  Text _getTitleContent() {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: GoogleStyle.bodyText.copyWith(
        color: ThemeColor.salmon400,
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _CustomItemCard extends StatelessWidget {
  const _CustomItemCard({
    required this.title,
    required this.iconName,
    required this.itemOnTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final String iconName;
  final VoidCallback itemOnTap;

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.circular(10);

    return Container(
      decoration: BoxDecoration(
        color: ThemeColor.white,
        borderRadius: radius,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: ThemeColor.eliteBlue.withOpacity(0.12),
            offset: const Offset(0, 8),
            blurRadius: 28,
            spreadRadius: -6,
          )
        ],
      ),
      child: _getBody(radius),
    );
  }

  Material _getBody(BorderRadius radius) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: itemOnTap,
        borderRadius: radius,
        child: _getContent(),
      ),
    );
  }

  Padding _getContent() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_getImage(), _getDescription()],
      ),
    );
  }

  Flexible _getDescription() {
    return Flexible(
      child: FittedBox(
        child: Text(
          title.overflow ?? '',
          maxLines: 1,
          style: GoogleStyle.bodyText.copyWith(fontSize: 12),
        ),
      ),
    );
  }

  Padding _getImage() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Image.asset(iconName),
    );
  }
}
