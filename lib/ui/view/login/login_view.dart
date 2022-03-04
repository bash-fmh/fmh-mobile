import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/constant_asset.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/model/country_model.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/login_vm.dart';
import 'package:fmh_mobile/ui/view/base_view.dart';
import 'package:fmh_mobile/ui/view/login/form_enterprise.dart';
import 'package:fmh_mobile/ui/view/login/form_legacy.dart';
import 'package:fmh_mobile/ui/view/login/form_v2.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        onInitReady: () => ref.read<LoginVM>(vmProvider).init(),
        builder: (context) {
          return Consumer(builder: (context, ref, child) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: ThemeColor.white,
                body: SingleChildScrollView(child: _getBody()),
              ),
            );
          });
        });
  }

  Widget _getBody() {
    final bool _isLoading = ref.watch(vmProvider.select((vm) => vm.isLoading));
    final List<ApplicationType> _applicationTypeList =
        ref.watch(vmProvider.select((vm) => vm.getApplicationTypeList));
    final ApplicationType _selectedApplicationType =
        ref.watch(vmProvider.select((vm) => vm.getSelectedApplicationType));
    final EnterpriseType? _selectedEnterpriseType =
        ref.watch(vmProvider.select((vm) => vm.getSelectedEnterpriseType));
    final List<CountryModel> _countryList =
        ref.watch(vmProvider.select((vm) => vm.getCountryList));
    final CountryModel? _selectedCountry =
        ref.watch(vmProvider.select((vm) => vm.getSelectedCountry));
    final String? _enterpriseName =
        ref.watch(vmProvider.select((vm) => vm.getEnterpriseName));
    final String? _enterprisePassword =
        ref.watch(vmProvider.select((vm) => vm.getEnterprisePassword));
    final String? _phoneNumber =
        ref.watch(vmProvider.select((vm) => vm.getPhoneNumber));

    return Column(
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (_isLoading) {
                    return;
                  }

                  _showApplicationTypeOptions(_applicationTypeList);
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
                      Text(getApplicationTypeString(_selectedApplicationType)),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Image.asset(ConstantAsset.chevronDown,
                            height: 12, width: 12),
                      )
                    ],
                  ),
                ),
              ),
              if (_selectedApplicationType == ApplicationType.enterprise)
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 2.5),
                      child: _enterpriseOption(
                          _selectedEnterpriseType, 'kfc', _isLoading),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.5, right: 10),
                      child: _enterpriseOption(
                          _selectedEnterpriseType, 'ph', _isLoading),
                    ),
                  ],
                ),
            ],
          ),
        ),
        if (_selectedApplicationType == ApplicationType.enterprise)
          FormEnterprise(
            ref: ref,
            isEnable: _selectedEnterpriseType != null,
            enterpriseName: _enterpriseName,
            enterprisePassword: _enterprisePassword,
            isLoading: _isLoading,
          ),
        if (_selectedApplicationType == ApplicationType.legacy) FormLegacy(),
        if (_selectedApplicationType == ApplicationType.v2)
          FormV2(
            ref: ref,
            countryList: _countryList,
            selectedCountry: _selectedCountry,
            phoneNumber: _phoneNumber,
          ),
      ],
    );
  }

  Future<void> _showApplicationTypeOptions(
      List<ApplicationType> applicationTypeList) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: applicationTypeList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      ref.read<LoginVM>(vmProvider).setSelectedApplicationType(
                          applicationTypeList[index]);
                      Navigator.of(context).pop();
                    },
                    title: Text(
                        getApplicationTypeString(applicationTypeList[index])),
                  );
                }),
          ),
        );
      },
    );
  }

  Widget _enterpriseOption(
      EnterpriseType? enterpriseType, String option, bool isLoading) {
    bool _isActive = false;
    String text = getLocalization.kfc;
    if (enterpriseType != null && option == 'kfc') {
      _isActive = enterpriseType == EnterpriseType.kfc;
    } else if (enterpriseType != null) {
      _isActive = enterpriseType == EnterpriseType.ph;
      text = getLocalization.ph;
    }

    if (option != 'kfc') {
      text = getLocalization.ph;
    }

    return GestureDetector(
      onTap: () {
        if (isLoading) {
          return;
        }

        if (option == 'kfc') {
          ref
              .read<LoginVM>(vmProvider)
              .setSelectedEnterpriseType(EnterpriseType.kfc);
        } else {
          ref
              .read<LoginVM>(vmProvider)
              .setSelectedEnterpriseType(EnterpriseType.ph);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: _isActive ? ThemeColor.sunny400 : ThemeColor.white,
            border: Border.all(
              color: _isActive ? ThemeColor.white : ThemeColor.sunny400,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Text(text),
      ),
    );
  }

  String getApplicationTypeString(ApplicationType type) {
    String result = '';
    switch (type) {
      case ApplicationType.legacy:
        result = 'Legacy';
        break;
      case ApplicationType.v2:
        result = 'V2';
        break;
      default:
        result = 'Enterprise';
        break;
    }

    return result;
  }
}
