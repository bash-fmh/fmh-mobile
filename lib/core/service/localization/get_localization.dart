import 'localization_service.dart';

/// helper class to add getter for localization class
class GetLocalization {
  String get dashboard => localizationService.text('dashboard');
  String get orders => localizationService.text('orders');
  String get products => localizationService.text('products');
  String get supplier => localizationService.text('suppliers');
  String get apps => localizationService.text('apps');
  String get notification => localizationService.text('notification');
  String get mtdVariance => localizationService.text('mtd_variance');
  String get mtdDiscard => localizationService.text('mtd_discard');
  String mtdSales({List<String>? args}) =>
      localizationService.text('mtd_sales', args: args);
  String get cost => localizationService.text('cost');
  String get qty => localizationService.text('qty');
  String get topVariance => localizationService.text('top_variance');
  String get topDiscard => localizationService.text('top_discard');
  String get noInternet => localizationService.text('no_internet');
  String get vs => localizationService.text('vs');
  String get appQuote => localizationService.text('app_quote');
  String get kfc => localizationService.text('kfc');
  String get ph => localizationService.text('ph');
  String get username => localizationService.text('username');
  String get password => localizationService.text('password');
  String get mobileNumber => localizationService.text('mobile_number');
  String get mobileNumberHint => localizationService.text('mobile_number_hint');
  String get continueText => localizationService.text('continue');
  String get login => localizationService.text('login');
  String get termsOfUseStatement =>
      localizationService.text('terms_of_use_statement');
  String get termsOfUse => localizationService.text('terms_of_use');
  String get and => localizationService.text('and');
  String get privacyPolicy => localizationService.text('privacy_policy');
  String testArg1({required String parm1, required String parm2}) =>
      '$parm1 ${localizationService.text('no_internet')} $parm2';
  String testArg2({List<String>? args}) =>
      localizationService.text('test_arg', args: args);
  
  String get noResult => localizationService.text('no_result');
}

GetLocalization getLocalization = GetLocalization();
