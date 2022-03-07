import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/constant_asset.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/constant/strings_constant.dart';
import 'package:fmh_mobile/core/model/country_model.dart';
import 'package:fmh_mobile/core/service/locator/locator.dart';
import 'package:fmh_mobile/core/service/navigation/nav_router.dart';
import 'package:fmh_mobile/core/service/navigation/navigation_service.dart';
import 'package:fmh_mobile/core/service/service.dart';
import 'package:fmh_mobile/core/service/system_config.dart';
import 'base_viewmodel.dart';

final vmProvider = ChangeNotifierProvider<LoginVM>((_) => LoginVM());

class LoginVM extends BaseViewModel {
  final Service _service = locator<ServiceImpl>();
  final List<ApplicationType> _applicationTypeList = [];
  ApplicationType? _selectedApplicationType;

  final List<EnterpriseType> _enterpriseTypeList = [];
  EnterpriseType? _selectedEnterpriseType;

  final List<CountryModel> _countryList = [];
  CountryModel? _selectedCountry;

  String? _enterpriseName;
  String? _enterprisePassword;
  String? _phoneNumber;

  Future<void> init() async {
    _applicationTypeList.addAll([
      ApplicationType.enterprise,
      ApplicationType.legacy,
      ApplicationType.v2,
    ]);

    _enterpriseTypeList.addAll([EnterpriseType.kfc, EnterpriseType.ph]);

    _countryList.addAll([
      CountryModel(
          id: 1,
          name: ConstantStrings.countryNameHK,
          code: ConstantStrings.countryCodeHK,
          image: ConstantAsset.flagHK),
      CountryModel(
          id: 2,
          name: ConstantStrings.countryNameID,
          code: ConstantStrings.countryCodeID,
          image: ConstantAsset.flagID),
      CountryModel(
          id: 3,
          name: ConstantStrings.countryNameMY,
          code: ConstantStrings.countryCodeMY,
          image: ConstantAsset.flagMY),
      CountryModel(
          id: 4,
          name: ConstantStrings.countryNameSG,
          code: ConstantStrings.countryCodeSG,
          image: ConstantAsset.flagSG),
      CountryModel(
          id: 5,
          name: ConstantStrings.countryNameTW,
          code: ConstantStrings.countryCodeTW,
          image: ConstantAsset.flagTW),
    ]);

    _selectedCountry = CountryModel(
        id: 3,
        name: ConstantStrings.countryNameMY,
        code: ConstantStrings.countryCodeMY,
        image: ConstantAsset.flagMY);
    await _setDefaultAppType();
  }

  List<ApplicationType> get getApplicationTypeList => _applicationTypeList;
  ApplicationType? get getSelectedApplicationType => _selectedApplicationType;

  List<EnterpriseType> get getEenterpriseTypeList => _enterpriseTypeList;
  EnterpriseType? get getSelectedEnterpriseType => _selectedEnterpriseType;

  List<CountryModel> get getCountryList => _countryList;
  CountryModel? get getSelectedCountry => _selectedCountry;

  String? get getEnterpriseName => _enterpriseName;
  String? get getEnterprisePassword => _enterprisePassword;
  String? get getPhoneNumber => _phoneNumber;

  Future<void> setSelectedApplicationType(ApplicationType type) async {
    if (_selectedApplicationType != type) {
      _selectedApplicationType = type;
      await _service.setAppType(type);
      await clearEnterpriseType();
      notifyListeners();
    }
  }

  Future<void> setSelectedEnterpriseType(EnterpriseType type) async {
    if (_selectedEnterpriseType != type) {
      _selectedEnterpriseType = type;
      await _service.setEnterpriseType(type);
      notifyListeners();
    }
  }

  void setSelectedCountry(CountryModel country) {
    if (_selectedCountry != country) {
      _selectedCountry = country;
      notifyListeners();
    }
  }

  void setEnterpriseName(String name) {
    if (_enterpriseName != name) {
      _enterpriseName = name;
      notifyListeners();
    }
  }

  void setEnterprisePassword(String password) {
    if (_enterprisePassword != password) {
      _enterprisePassword = password;
      notifyListeners();
    }
  }

  void setPhoneNumber(String phoneNumber) {
    if (_phoneNumber != phoneNumber) {
      _phoneNumber = phoneNumber;
      notifyListeners();
    }
  }

  Future<void> clearEnterpriseType() async {
    if (_selectedApplicationType != ApplicationType.enterprise) {
      await _service.clearEnterpriseType();
      _selectedEnterpriseType = null;
      _enterpriseName = '';
      _enterprisePassword = '';
    } else {
      _phoneNumber = '';
    }
  }

  Future<void> _setDefaultAppType() async {
    final ApplicationType _appType = _applicationTypeList.firstWhere(
      (type) => type == SystemConfig.instance.appType,
      orElse: () => ApplicationType.enterprise,
    );
    await setSelectedApplicationType(_appType);
    if (_appType == ApplicationType.enterprise) {
      final int index = _enterpriseTypeList
          .indexWhere((type) => type == SystemConfig.instance.enterpriseType);
      if (index > -1) {
        await setSelectedEnterpriseType(_enterpriseTypeList[index]);
      }
    }
  }

  void hideKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  Future<void> loginCallback() async {
    setBusy();
    Future.delayed(Duration(seconds: 5), () {
      navigationService.pushAndRemoveUntil(NavRouter.landingRoute);
      setIdle();
    });
  }
}
