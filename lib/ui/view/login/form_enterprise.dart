import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';
import 'package:fmh_mobile/core/service/navigation/nav_router.dart';
import 'package:fmh_mobile/core/service/navigation/navigation_service.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/login_vm.dart';
import 'package:fmh_mobile/ui/widget/custom_button.dart';

class FormEnterprise extends StatelessWidget {
  const FormEnterprise({
    required this.ref,
    Key? key,
  }) : super(key: key);

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final bool _isLoading = ref.watch(vmProvider.select((vm) => vm.isBusy));
    final EnterpriseType? _selectedEnterpriseType =
        ref.watch(vmProvider.select((vm) => vm.getSelectedEnterpriseType));
    final bool _isEnable = _selectedEnterpriseType != null;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: TextField(
            enabled: _isEnable && !_isLoading,
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
            enabled: _isEnable && !_isLoading,
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
            isLoading: _isLoading,
            enable: _isAvailable(ref, _isEnable),
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

  bool _isAvailable(WidgetRef ref, bool isEnable) {
    final String? _enterpriseName =
        ref.watch(vmProvider.select((vm) => vm.getEnterpriseName));
    ;
    final String? _enterprisePassword =
        ref.watch(vmProvider.select((vm) => vm.getEnterprisePassword));

    return isEnable &&
        (_enterpriseName?.isNotEmpty ?? false) &&
        (_enterprisePassword?.isNotEmpty ?? false);
  }

  void _loginCallback() {
    ref.read<LoginVM>(vmProvider).setBusy();
    Future.delayed(Duration(seconds: 5), () {
      navigationService.pushAndRemoveUntil(NavRouter.dashboardRouter);
    });
  }
}
