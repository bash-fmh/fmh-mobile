import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmh_mobile/core/constant/constant_asset.dart';
import 'package:fmh_mobile/core/extension/string_ext.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColor.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            15, MediaQuery.of(context).viewPadding.top, 15, 15),
        child: _getBody(),
      ),
    );
  }

  Row _getBody() {
    return Row(
      children: <Widget>[
        _getEnvMessage(),
        _AppsTitle(),
        _CustomIcon(iconName: ConstantAsset.scanner, iconOnClick: () {}),
        _CustomIcon(iconName: ConstantAsset.cart, iconOnClick: () {})
      ],
    );
  }

  Widget _getEnvMessage() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        color: ThemeColor.sunny300,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          'Staging'.overflow ?? '',
          maxLines: 1,
          style: GoogleStyle.bodyText.copyWith(
              color: ThemeColor.sunny500, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class _AppsTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          _getTitle(),
          _getCustomText(
              '+KIOSK PORT KLANG (closed since 31/12/19)'.overflow ?? '')
        ],
      ),
    );
  }

  Row _getTitle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: _getCustomText('1130033'.overflow ?? ''),
          ),
        ),
        Flexible(
          child: Container(
            color: ThemeColor.salmon400,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            child: _getCustomText('10463'.overflow ?? '',
                fontColor: ThemeColor.salmon600),
          ),
        ),
      ],
    );
  }

  Text _getCustomText(String text, {Color fontColor = ThemeColor.black}) {
    return Text(
      text,
      maxLines: 1,
      style: GoogleStyle.bodyText
          .copyWith(color: fontColor, fontWeight: FontWeight.w700),
    );
  }
}

class _CustomIcon extends StatelessWidget {
  const _CustomIcon(
      {required this.iconName, required this.iconOnClick, Key? key})
      : super(key: key);

  final String iconName;
  final VoidCallback iconOnClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: iconOnClick,
          child: Image.asset(
            iconName,
            color: ThemeColor.black,
          ),
        ),
      ),
    );
  }
}
