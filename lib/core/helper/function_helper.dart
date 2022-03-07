import 'package:flutter/material.dart';

class FunctionHelper {
  FunctionHelper._();

  static bool isNeedSafeArea(BuildContext context) =>
      MediaQuery.of(context).viewPadding.top > 0;

     
}
