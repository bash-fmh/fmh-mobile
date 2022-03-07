import 'package:flutter/material.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/ui/widget/loading_screen.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.enableColor,
    required this.disableColor,
    required this.text,
    required this.disableTextColor,
    required this.callback,
    Key? key,
    this.width = double.infinity,
    this.height = 44,
    this.enable = true,
    this.textStyle,
    this.isLoading = false,
  }) : super(key: key);

  final double width;
  final double height;
  final bool enable;
  final Color enableColor;
  final Color disableColor;
  final String text;
  final TextStyle? textStyle;
  final Color disableTextColor;
  final VoidCallback? callback;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
      primary: _isAvailable() ? enableColor : disableColor,
      minimumSize: Size(width, height),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );

    final TextStyle elevatedButtonTextStyle =
        textStyle ?? GoogleStyle.button.copyWith(color: ThemeColor.brass700);

    return ElevatedButton(
      style: elevatedButtonStyle,
      onPressed: enable && !isLoading ? (callback ?? () {}) : () {},
      child: isLoading
          ? LoadingScreen()
          : Text(text,
              style: _isAvailable()
                  ? elevatedButtonTextStyle
                  : elevatedButtonTextStyle.copyWith(color: disableTextColor)),
    );
  }

  bool _isAvailable() {
    return enable && !isLoading;
  }
}
