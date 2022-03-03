import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/constant_asset.dart';
import 'package:fmh_mobile/core/viewmodel/enterprise/dashboard_vm.dart';

PreferredSize getCustomAppBar(WidgetRef ref) {
  return PreferredSize(
    preferredSize: const Size(double.infinity, kToolbarHeight),
    child: SizedBox.expand(
      child: Container(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: <Widget>[
                Image.asset(ConstantAsset.mainLogoIcon),
                const Spacer(),
                InkWell(
                    onTap: ref.read<DashboardVM>(vmProvider).onSearchTap,
                    child: Image.asset(ConstantAsset.search)),
                const SizedBox(width: 15),
                InkWell(
                    onTap: ref
                        .read<DashboardVM>(vmProvider)
                        .onNotificationTap,
                    child: Image.asset(ConstantAsset.notification)),
                const SizedBox(width: 15),
                InkWell(
                    onTap:
                    ref.read<DashboardVM>(vmProvider).onMenuListTap,
                    child: Image.asset(ConstantAsset.burgerMenu)),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
