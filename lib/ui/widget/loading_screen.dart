import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    this.width = 20,
    this.height = 20,
    this.strokeWidth = 2,
    this.color,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;
  final double strokeWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child:
            CircularProgressIndicator(strokeWidth: strokeWidth, color: color),
      ),
    );
  }
}
