import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';

class NotificationHeaderContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColor.sunny500,
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, Platform.isIOS ? 48 : 24, 15, 10),
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
          child: Icon(
            Icons.crop_free,
            color: ThemeColor.white,
          )
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Stack(
            children: <Widget> [
              Icon(
                Icons.shopping_cart,
                color: ThemeColor.white,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                  alignment: Alignment.center,
                  child: Text(
                    '50',
                    style: TextStyle(color: ThemeColor.white, fontSize: 10),
                  ),
                ),
              )
            ],
          )
        )
      ],
    );
  }

  Expanded _getContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '1234',
                style: GoogleStyle.bodyText
                    .copyWith(color: ThemeColor.white, fontSize: 14),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  '4906',
                  style: GoogleStyle.bodyText
                      .copyWith(color: ThemeColor.sunny300, fontSize: 14, backgroundColor: ThemeColor.sunny700),
                ),
              ),
            ],
          ),
          Text(
            '+KIOSK PORT KLANG',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: GoogleStyle.bodyText
                .copyWith(color: ThemeColor.white, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
