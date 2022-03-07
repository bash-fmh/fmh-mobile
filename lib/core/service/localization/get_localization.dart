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
  String get pendingToReceive => localizationService.text('pending_to_receive');
  String get requestAndOrder => localizationService.text('request_and_Order');
  String get placeOrder => localizationService.text('place_order');
  String get receiving => localizationService.text('receiving');
  String get creditNote => localizationService.text('credit_note');
  String get stockManagement => localizationService.text('stock_management');
  String get stockCount => localizationService.text('stock_count');
  String get discard => localizationService.text('discard');
  String get transfer => localizationService.text('transfer');
  String get others => localizationService.text('others');
  String get oilControl => localizationService.text('oil_control');
  String get sAndDCost => localizationService.text('s_and_d_cost');
  String get parVariant => localizationService.text('par_variant');
  String get settings => localizationService.text('settings');
  String get vs => localizationService.text('vs');

  String testArg1({required String parm1, required String parm2}) =>
      '$parm1 ${localizationService.text('no_internet')} $parm2';

  String testArg2({List<String>? args}) =>
      localizationService.text('test_arg', args: args);
}

GetLocalization getLocalization = GetLocalization();
