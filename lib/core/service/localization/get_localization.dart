import 'localization_service.dart';

/// helper class to add getter for localization class
class GetLocalization {
  String get home => localizationService.text('home');
  String get search => localizationService.text('search');
  String get profile => localizationService.text('profile');
  String get noInternet => localizationService.text('no_internet');
}

GetLocalization getLocalization = GetLocalization();
