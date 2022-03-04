import 'package:flutter/material.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/ui/widget/custom_button.dart';

class FormLegacy extends StatelessWidget {
  const FormLegacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              enabled: false,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              labelText: getLocalization.username,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: TextField(
            enabled: false,
            obscureText: true,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              labelText: getLocalization.password,
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
          child: CustomButton(
            enable: false,
            height: 44,
            enableColor: ThemeColor.sunny400,
            disableColor: ThemeColor.sunny200,
            disableTextColor: ThemeColor.brass200,
            text: getLocalization.continueText.toUpperCase(),
            callback: _loginCallback,
          ),
        ),
      ],
    );
  }

  void _loginCallback() {}
}
