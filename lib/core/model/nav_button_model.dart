import 'package:fmh_mobile/core/constant/enum.dart';

class NavButton {
  NavButtonType navButtonType;
  String? name;
  String asset;
  ButtonStatus buttonStatus;

  NavButton(
      {required this.navButtonType,
      required this.name,
      required this.asset,
      this.buttonStatus = ButtonStatus.deactivate});
}
