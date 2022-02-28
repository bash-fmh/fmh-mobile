import 'package:fmh_mobile/core/constant/constant_asset.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/model/nav_button_model.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/service/locator/locator.dart';
import 'package:fmh_mobile/core/service/service.dart';
import 'base_viewmodel.dart';

final vmProvider = ChangeNotifierProvider<DashboardVM>((ref) => DashboardVM());

class DashboardVM extends BaseViewModel {
  TabController? _tabController;
  TabController? get tabController => _tabController;

  final Service _service = locator<ServiceImpl>();

  bool _selected = false;
  bool? get selected => _selected;

  List<NavButton> get navButtons => _navButtons;

  NavButtonType _selectedNavButton = NavButtonType.home;
  NavButtonType get selectedNavButton => _selectedNavButton;

  final List<NavButton> _navButtons = [
    NavButton(
        navButtonType: NavButtonType.home,
        name: getLocalization.home,
        asset: ConstantAsset.block,
        buttonStatus: ButtonStatus.active),
    NavButton(
        navButtonType: NavButtonType.search,
        name: getLocalization.search,
        asset: ConstantAsset.search,
        buttonStatus: ButtonStatus.active),
    NavButton(
        navButtonType: NavButtonType.profile,
        name: getLocalization.profile,
        asset: ConstantAsset.cart,
        buttonStatus: ButtonStatus.deactivate),
  ];

  Future<void> init(TickerProvider tickerProvider, {int index = 0}) async {
    _tabController = TabController(
      vsync: tickerProvider,
      length: 3,
      initialIndex: index,
    );
  }

  set selectedNavButton(NavButtonType? selectedNav) {
    if (selectedNav != null && _selectedNavButton != selectedNav) {
      _selectedNavButton = selectedNav;
      for (NavButton nav in _navButtons) {
        if (nav.navButtonType == selectedNav) {
          nav.buttonStatus = ButtonStatus.active;
        } else {
          nav.buttonStatus = ButtonStatus.deactivate;
        }
      }
      switch (selectedNav) {
        case NavButtonType.home:
          tabController?.animateTo(0);
          break;
        case NavButtonType.search:
          tabController?.animateTo(1);
          break;
        case NavButtonType.profile:
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

  Future<void> onHome() async {
    try {
      setBusy();
      final countries = (await _service.getCountryList()).countries ?? [];
      setIdle();
    } catch (e, s) {
      setError(e, s);
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
}
