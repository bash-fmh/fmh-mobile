import 'package:flutter/material.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.child, this.paddingSize = 15});

  final Widget child;
  final double paddingSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ThemeColor.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ThemeColor.eliteBlue.withOpacity(0.12),
              offset: const Offset(0, 8),
              blurRadius: 28,
              spreadRadius: -6,
            )
          ]),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingSize), child: child),
    );
  }
}
