import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/constant_asset.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/enterprise/apps_vm.dart';
import 'package:fmh_mobile/ui/view/enterprise/apps/item_group_list.dart';

class DetailContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: <Widget>[
          _reminderCard(),
          ItemGroupList(),
        ],
      ),
    );
  }
}

class _reminderCard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BorderRadius radius = BorderRadius.circular(10);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration:
            BoxDecoration(color: ThemeColor.salmon400, borderRadius: radius),
        width: double.infinity,
        child: _getBody(radius, ref),
      ),
    );
  }

  Material _getBody(BorderRadius radius, WidgetRef ref) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: radius,
        onTap: ref.read(vmAppsProvider).pendingToReceived,
        child: _getContent(),
      ),
    );
  }

  Widget _getContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: _getCustomText(getLocalization.pendingToReceive,
                  fontSize: 14)),
          _getCustomText('150', fontSize: 24),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              ConstantAsset.forward,
              color: ThemeColor.white,
            ),
          )
        ],
      ),
    );
  }

  Text _getCustomText(String text, {required double fontSize}) {
    return Text(
      text,
      style: GoogleStyle.bodyText.copyWith(
        color: ThemeColor.white,
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
      ),
    );
  }
}
