import 'package:flutter/material.dart';
import 'package:fmh_mobile/ui/shared/theme_color.dart';

import 'curved_shape_background.dart';

AppBar getAppBar(
    {required Widget title,
    List<Widget>? actions,
    bool centerTitle = false,
    bool automaticallyImplyLeading = true,
    Widget? leading,
    Color backgroundColor = ThemeColor.shadeWhite}) {
  return AppBar(
    title: title,
    backgroundColor: backgroundColor,
    elevation: 0.0,
    actions: actions ?? [],
    leading: leading,
    centerTitle: centerTitle,
    automaticallyImplyLeading: automaticallyImplyLeading,
  );
}

PreferredSizeWidget getCurvedAppBar(
    {Widget? title, bool centerTitle = true, Widget? leading}) {
  return AppBar(
    leading: leading,
    centerTitle: true,
    title: title,
    elevation: 0,
    backgroundColor: ThemeColor.brandYellow,
    shape: CurvedShape(),
  );
}
