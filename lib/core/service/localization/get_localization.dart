import 'localization_service.dart';

/// helper class to add getter for localization class
class GetLocalization {
  String get dashboard => localizationService.text('dashboard');
  String get orders => localizationService.text('orders');
  String get products => localizationService.text('products');
  String get supplier => localizationService.text('suppliers');
  String get apps => localizationService.text('apps');
  String get notification => localizationService.text('notification');
  String get mtdVariance => localizationService.text('mtdVariance');
  String get mtdDiscard => localizationService.text('mtdDiscard');
  String get mtdSales => localizationService.text('mtdSales');
  String get cost => localizationService.text('cost');
  String get qty => localizationService.text('qty');
  String get topVariance => localizationService.text('topVariance');
  String get topDiscard => localizationService.text('topDiscard');
  String get noInternet => localizationService.text('no_internet');

  String testArg1({required String parm1, required String parm2}) =>
      '$parm1 ${localizationService.text('no_internet')} $parm2';

  String testArg2({List<String>? args}) =>
      localizationService.text('test_arg', args: args);
}

GetLocalization getLocalization = GetLocalization();
