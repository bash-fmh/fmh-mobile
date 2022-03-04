import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/constant_asset.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/exception/unauthorized.dart';
import 'package:fmh_mobile/core/model/nav_button_model.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';

import '../base_viewmodel.dart';

final vmLandingProvider =
    ChangeNotifierProvider<LandingVM>((ref) => LandingVM());

class LandingVM extends BaseViewModel {
  TabController? _tabController;

  TabController? get tabController => _tabController;

  // TODO: Remove after no used for reference
  // final Service _service = locator<ServiceImpl>();

  bool _selected = false;

  bool? get selected => _selected;

  List<NavButton> get navButtons => _navButtonsEnterprise;

  NavButtonType _selectedNavButton = NavButtonType.dashboard;

  NavButtonType get selectedNavButton => _selectedNavButton;

  final List<NavButton> _navButtonsEnterprise = [
    NavButton(
        navButtonType: NavButtonType.dashboard,
        name: getLocalization.dashboard,
        asset: ConstantAsset.dashboardEnterprise,
        buttonStatus: ButtonStatus.active),
    NavButton(
        navButtonType: NavButtonType.apps,
        name: getLocalization.apps,
        asset: ConstantAsset.dashboard),
    NavButton(
        navButtonType: NavButtonType.notification,
        name: getLocalization.notification,
        asset: ConstantAsset.notification),
  ];

  Future<void> init(TickerProvider tickerProvider, {int index = 0}) async {
    _tabController = TabController(
      vsync: tickerProvider,
      length: _navButtonsEnterprise.length,
      initialIndex: index,
    );
  }

  set selectedNavButton(NavButtonType? selectedNav) {
    if (selectedNav != null && _selectedNavButton != selectedNav) {
      _selectedNavButton = selectedNav;
      for (NavButton nav in _navButtonsEnterprise) {
        if (nav.navButtonType == selectedNav) {
          nav.buttonStatus = ButtonStatus.active;
        } else {
          nav.buttonStatus = ButtonStatus.deactivate;
        }
      }
      switch (selectedNav) {
        case NavButtonType.dashboard:
          tabController?.animateTo(0);
          break;
        case NavButtonType.apps:
          tabController?.animateTo(1);
          break;
        case NavButtonType.notification:
          tabController?.animateTo(2);
          break;
        default:
      }
      notifyListeners();
    }
  }

  void setSelected() {
    _selected = !_selected;
    notifyListeners();
  }

  // TODO: Remove after no used for reference
  Future<void> onHome() async {
    try {
      setBusy();
      // final countries = (await _service.getCountryList()).countries ?? [];
      // print(countries.toString());
      print('load home');
      setIdle();
    } catch (e, s) {
      setError(e, s);
    }
  }

  // TODO: Remove after no used for reference
  Future<void> testThrow() async {
    // to test and show how runZonedGuarded catch uncaught exceptions
    throw UnAuthorizedException;
  }

  // TODO: Remove after no used for reference
  void onSearchTap() {
    debugPrint('search');
  }

  // TODO: Remove after no used for reference
  void onNotificationTap() {
    debugPrint('notification');
  }

  // TODO: Remove after no used for reference
  void onMenuListTap() {
    debugPrint('menu list');
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
}
