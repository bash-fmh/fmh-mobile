import 'package:flutter/material.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleStyle {
  GoogleStyle._();

  // Source: https://www.figma.com/file/l1xFc1zNFoCRoK2JERUtf6/Ligature-DS%3A-Component?node-id=601%3A8230

  static TextStyle displayLarge = GoogleFonts.inter(
    color: ThemeColor.gray800,
    fontSize: 42,
    height: 52,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  static TextStyle displayBold = GoogleFonts.inter(
    color: ThemeColor.gray800,
    fontSize: 30,
    height: 36,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  static TextStyle display = GoogleFonts.inter(
    color: ThemeColor.gray800,
    fontSize: 30,
    height: 36,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static TextStyle headingBold = GoogleFonts.inter(
    color: ThemeColor.gray800,
    fontSize: 22,
    height: 28,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  static TextStyle heading = GoogleFonts.inter(
    color: ThemeColor.gray800,
    fontSize: 22,
    height: 28,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static TextStyle subheading = GoogleFonts.inter(
    color: ThemeColor.gray800,
    fontSize: 16,
    height: 20,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  static TextStyle subheading2 = GoogleFonts.inter(
    color: ThemeColor.gray800,
    fontSize: 16,
    height: 20,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );

  static TextStyle button = GoogleFonts.inter(
    color: ThemeColor.gray800,
    fontSize: 16,
    height: 20,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );

  static TextStyle bodyText = GoogleFonts.inter(
    color: ThemeColor.gray800,
    fontSize: 16,
    height: 20,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static TextStyle captionBold = GoogleFonts.inter(
    color: ThemeColor.gray800,
    fontSize: 12,
    height: 16,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  static TextStyle captionSemibold = GoogleFonts.inter(
    color: ThemeColor.gray800,
    fontSize: 12,
    height: 16,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );

  static TextStyle caption = GoogleFonts.inter(
    color: ThemeColor.gray800,
    fontSize: 12,
    height: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
}
