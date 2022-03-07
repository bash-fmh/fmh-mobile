import 'package:flutter/material.dart';
import 'package:fmh_mobile/core/constant/constant_asset.dart';
import 'package:fmh_mobile/core/helper/function_helper.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';

class HeaderContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 8, 15, 10),
      child: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return SafeArea(
      top: FunctionHelper.isNeedSafeArea(context),
      child: Row(
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
      ),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              '+KIOSK PORT KLANG (closed since 31/12/19)',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: GoogleStyle.bodyText.copyWith(
                  color: ThemeColor.white, fontWeight: FontWeight.w700),
            ),
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
