import 'package:flutter/material.dart';
import 'package:fmh_mobile/ui/shared/theme_color.dart';

class RobotoStyle {
  RobotoStyle._();

  static TextStyle defaultStyle = const TextStyle(
    fontFamily: 'Roboto',
    color: ThemeColor.black,
  );

  static TextStyle subtitle = defaultStyle.copyWith(
      fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15);

  static TextStyle subtitle1 = defaultStyle.copyWith(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15);

  static TextStyle subtitle2 = defaultStyle.copyWith(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1);

  static TextStyle body1 = defaultStyle.copyWith(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5);

  static TextStyle body2 = defaultStyle.copyWith(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25);

  static TextStyle caption = defaultStyle.copyWith(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4);

  static TextStyle caption2 = defaultStyle.copyWith(
      fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.4);

  static TextStyle overLine = defaultStyle.copyWith(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 0.5);

  static TextStyle h1 = defaultStyle.copyWith(
      fontSize: 24, fontWeight: FontWeight.w400, letterSpacing: 0.5);

  static TextStyle h4 = defaultStyle.copyWith(
      fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 0.5);

  static TextStyle button = defaultStyle.copyWith(
      fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 0.5);

  static TextStyle h3 =
      defaultStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold);
}
