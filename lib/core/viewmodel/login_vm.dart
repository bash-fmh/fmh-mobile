import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/constant_asset.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/model/country_model.dart';
import 'base_viewmodel.dart';

final vmProvider = ChangeNotifierProvider<LoginVM>((_) => LoginVM());

class LoginVM extends BaseViewModel {
  final List<ApplicationType> _applicationTypeList = [];
  ApplicationType _selectedApplicationType = ApplicationType.enterprise;

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

    _countryList.addAll([
      CountryModel(
          id: 1,
          name: 'Hong Kong (香港)',
          code: '+852',
          image: ConstantAsset.flagHK),
      CountryModel(
          id: 2, name: 'Indonesia', code: '+62', image: ConstantAsset.flagID),
      CountryModel(
          id: 3, name: 'Malaysia', code: '+60', image: ConstantAsset.flagMY),
      CountryModel(
          id: 4, name: 'Singapore', code: '+65', image: ConstantAsset.flagSG),
      CountryModel(
          id: 5,
          name: 'Taiwan (台灣)',
          code: '+886',
          image: ConstantAsset.flagTW),
    ]);

    _selectedCountry = CountryModel(
        id: 3, name: 'Malaysia', code: '+60', image: ConstantAsset.flagMY);
  }

  List<ApplicationType> get getApplicationTypeList => _applicationTypeList;
  ApplicationType get getSelectedApplicationType => _selectedApplicationType;

  EnterpriseType? get getSelectedEnterpriseType => _selectedEnterpriseType;

  List<CountryModel> get getCountryList => _countryList;
  CountryModel? get getSelectedCountry => _selectedCountry;

  String? get getEnterpriseName => _enterpriseName;
  String? get getEnterprisePassword => _enterprisePassword;
  String? get getPhoneNumber => _phoneNumber;

  void setSelectedApplicationType(ApplicationType type) {
    _selectedApplicationType = type;

    notifyListeners();
  }

  void setSelectedEnterpriseType(EnterpriseType type) {
    _selectedEnterpriseType = type;

    notifyListeners();
  }

  void setSelectedCountry(CountryModel country) {
    _selectedCountry = country;

    notifyListeners();
  }

  void setEnterpriseName(String name) {
    _enterpriseName = name;

    notifyListeners();
  }

  void setEnterprisePassword(String password) {
    _enterprisePassword = password;

    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;

    notifyListeners();
  }
}
