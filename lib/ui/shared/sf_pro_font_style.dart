import 'package:flutter/material.dart';
import 'package:fmh_mobile/ui/shared/theme_color.dart';

class SfProStyle {
  SfProStyle._();

  static TextStyle defaultStyle = const TextStyle(
    fontFamily: 'SF Pro Text',
    color: ThemeColor.black,
  );

  static TextStyle title =
      defaultStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w700);

  static TextStyle subtitle1 =
      defaultStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle subtitle2 = defaultStyle.copyWith(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1);

  static TextStyle subtitle3 =
      defaultStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400);
}
