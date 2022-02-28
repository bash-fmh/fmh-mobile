import 'package:flutter/material.dart';

class CurvedShape extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Path path = Path();
    path.lineTo(0, rect.height - 15);
    path.quadraticBezierTo(
        rect.width / 2, rect.height + 30, rect.width, rect.height - 15);
    path.lineTo(rect.width, 0);
    path.close();

    return path;
  }
}
