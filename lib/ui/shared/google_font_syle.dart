import 'package:flutter/material.dart';
import 'package:fmh_mobile/ui/shared/theme_color.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleStyle {
  GoogleStyle._();

  static TextStyle linkTextButton = GoogleFonts.inter(
      color: ThemeColor.black,
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);

  static TextStyle hintTextField = GoogleFonts.inter(
      color: ThemeColor.black,
      fontSize: 16,
      height: 22 / 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);

  static TextStyle dropDownItem = GoogleFonts.inter(
      color: ThemeColor.black,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: 1.375);
}
