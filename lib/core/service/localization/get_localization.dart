import 'localization_service.dart';

/// helper class to add getter for localization class
class GetLocalization {
  String get home => localizationService.text('home');
  String get search => localizationService.text('search');
  String get profile => localizationService.text('profile');
  String get noInternet => localizationService.text('no_internet');

  String testArg1({required String parm1, required String parm2}) =>
      '$parm1 ${localizationService.text('no_internet')} $parm2';

  String testArg2({List<String>? args}) =>
      localizationService.text('test_arg', args: args);
}

GetLocalization getLocalization = GetLocalization();
