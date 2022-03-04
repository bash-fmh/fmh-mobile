import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:fmh_mobile/core/constant/constant_asset.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';

class HeaderContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double verticalPadding = 10;
    final double topPadding = Platform.isAndroid
        ? (MediaQuery.of(context).viewPadding.top + verticalPadding)
        : verticalPadding.toDouble();

    return Container(
      color: ThemeColor.sunny500,
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, topPadding, 15, verticalPadding),
        child: _getBody(),
      ),
    );
  }

  Row _getBody() {
    return Row(
      children: <Widget>[
        _getContent(),

        /// Reload Button
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            ConstantAsset.reload,
            color: ThemeColor.white,
          ),
        ),
      ],
    );
  }

  Expanded _getContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '1130033',
            style: GoogleStyle.bodyText
                .copyWith(color: ThemeColor.white, fontSize: 14),
          ),
          Text(
            '+KIOSK PORT KLANG (closed since 31/12/19)',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: GoogleStyle.bodyText
                .copyWith(color: ThemeColor.white, fontWeight: FontWeight.w700),
          ),
          Text(
            '01 Mar 2022 - 02 Mar 2022',
            style: GoogleStyle.bodyText
                .copyWith(color: ThemeColor.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
