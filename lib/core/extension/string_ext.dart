import 'package:flutter/material.dart';

extension StringExt on String {
  /// Extension for handling overflow, function:
  /// uses the Characters package to add non-break spaces between REAL chars
  /// by respecting Unicode chars that take up multiple bytes
  /// (which is replace only some character)
  String? get overflow => Characters(this)
      .replaceAll(Characters(''), Characters('\u{200B}'))
      .toString();
}
