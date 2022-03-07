import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/constant_asset.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/helper/string_helper.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/login_vm.dart';
import 'package:fmh_mobile/ui/view/base_view.dart';
import 'package:fmh_mobile/ui/view/login/form_enterprise.dart';
import 'package:fmh_mobile/ui/view/login/form_legacy.dart';
import 'package:fmh_mobile/ui/view/login/form_v2.dart';

class LoginView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseView(
        onInitReady: () => ref.read<LoginVM>(vmProvider).init(),
        builder: (context) {
          return Consumer(builder: (context, ref, child) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: ThemeColor.white,
                body: SingleChildScrollView(child: _getBody(context, ref)),
              ),
            );
          });
        });
  }

  Widget _getBody(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _hideKeyboard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
            child: Image.asset(ConstantAsset.fmhLoginLogo),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              getLocalization.appQuote,
              style: GoogleStyle.displayBold,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Image.asset(ConstantAsset.fmhLoginImage),
            ),
          ),
          _getForms(context, ref),
        ],
      ),
    );
  }

  Column _getForms(BuildContext context, WidgetRef ref) {
    final bool _isLoading = ref.watch(vmProvider.select((vm) => vm.isBusy));
    final ApplicationType _selectedApplicationType =
        ref.watch(vmProvider.select((vm) => vm.getSelectedApplicationType));

    final List<Widget> widgets = [];
    widgets.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (!_isLoading) {
                _showApplicationTypeOptions(context, ref);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: ThemeColor.gray400,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_selectedApplicationType.getString.toTitleCase),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Image.asset(ConstantAsset.chevronDown,
                        height: 12, width: 12),
                  )
                ],
              ),
            ),
          ),
          Row(children: _enterpriseOptions(ref, _isLoading)),
        ],
      ),
    ));

    switch (_selectedApplicationType) {
      case ApplicationType.enterprise:
        widgets.add(FormEnterprise(ref: ref));
        break;
      case ApplicationType.v2:
        widgets.add(FormV2(ref: ref));
        break;
      default:
        widgets.add(FormLegacy());
        break;
    }

    return Column(children: widgets);
  }

  Future<void> _showApplicationTypeOptions(
      BuildContext context, WidgetRef ref) {
    final List<ApplicationType> _applicationTypeList =
        ref.watch(vmProvider.select((vm) => vm.getApplicationTypeList));

    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _applicationTypeList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      ref.read<LoginVM>(vmProvider).setSelectedApplicationType(
                          _applicationTypeList[index]);
                      Navigator.of(context).pop();
                    },
                    title:
                        Text(_applicationTypeList[index].getString.toTitleCase),
                  );
                }),
          ),
        );
      },
    );
  }

  List<Widget> _enterpriseOptions(WidgetRef ref, bool isLoading) {
    final ApplicationType _selectedApplicationType =
        ref.watch(vmProvider.select((vm) => vm.getSelectedApplicationType));
    final List<EnterpriseType> _enterpriseTypeList =
        ref.watch(vmProvider.select((vm) => vm.getEenterpriseTypeList));
    final EnterpriseType? _selectedEnterpriseType =
        ref.watch(vmProvider.select((vm) => vm.getSelectedEnterpriseType));

    if (_selectedApplicationType != ApplicationType.enterprise) {
      return [];
    }

    final List<Widget> widgets = [];
    for (var e in _enterpriseTypeList) {
      final bool _isActive = e == _selectedEnterpriseType;
      final String _text = e.getString.toUpperCase();
      final bool _isFirstData = e == _enterpriseTypeList.first;

      widgets.add(Padding(
        padding: _isFirstData
            ? const EdgeInsets.only(left: 10, right: 2.5)
            : const EdgeInsets.only(left: 2.5, right: 10),
        child: GestureDetector(
          onTap: () {
            if (isLoading) {
              return;
            }

            ref.read<LoginVM>(vmProvider).setSelectedEnterpriseType(e);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: _isActive ? ThemeColor.sunny400 : ThemeColor.white,
                border: Border.all(
                  color: _isActive ? ThemeColor.white : ThemeColor.sunny400,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Text(_text),
          ),
        ),
      ));
    }

    return widgets;
  }

  void _hideKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
