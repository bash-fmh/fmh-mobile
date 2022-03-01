import 'package:flutter/material.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';

final ThemeData defaultThemeData = ThemeData(
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(color: ThemeColor.black),
    centerTitle: true,
    color: ThemeColor.white,
    elevation: 0,
    iconTheme: IconThemeData(color: ThemeColor.black),
  ),
  scaffoldBackgroundColor: ThemeColor.sunny100,
);
