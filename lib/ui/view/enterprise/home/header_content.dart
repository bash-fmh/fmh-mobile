import 'package:flutter/material.dart';
import 'package:fmh_mobile/core/constant/constant_asset.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';

class HeaderContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: ThemeColor.sunny500,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              15, MediaQuery.of(context).viewPadding.top, 15, 0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      style: GoogleStyle.bodyText.copyWith(
                          color: ThemeColor.white, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '01 Mar 2022 - 02 Mar 2022',
                      style: GoogleStyle.bodyText
                          .copyWith(color: ThemeColor.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                ConstantAsset.reload,
                color: ThemeColor.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
