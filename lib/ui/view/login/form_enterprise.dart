import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';
import 'package:fmh_mobile/core/service/navigation/nav_router.dart';
import 'package:fmh_mobile/core/service/navigation/navigation_service.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/login_vm.dart';
import 'package:fmh_mobile/ui/widget/custom_button.dart';

class FormEnterprise extends StatelessWidget {
  const FormEnterprise({
    required this.ref,
    required this.isEnable,
    required this.enterpriseName,
    required this.enterprisePassword,
    required this.isLoading,
    Key? key,
  }) : super(key: key);

  final WidgetRef ref;
  final bool isEnable;
  final String? enterpriseName;
  final String? enterprisePassword;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: TextField(
            enabled: isEnable && !isLoading,
            onChanged: (text) {
              ref.read<LoginVM>(vmProvider).setEnterpriseName(text);
            },
            decoration: InputDecoration(
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
            enabled: isEnable && !isLoading,
            onChanged: (text) {
              ref.read<LoginVM>(vmProvider).setEnterprisePassword(text);
            },
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
            isLoading: isLoading,
            enable: _isAvailable(),
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

  bool _isAvailable() {
    return isEnable &&
        (enterpriseName?.isNotEmpty ?? false) &&
        (enterprisePassword?.isNotEmpty ?? false);
  }

  void _loginCallback() {
    ref.read<LoginVM>(vmProvider).setLoading();
    Future.delayed(Duration(seconds: 5), () {
      navigationService.pushAndRemoveUntil(NavRouter.dashboardRouter);
    });
  }
}
