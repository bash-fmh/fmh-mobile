// final vmDashboardProvider = ChangeNotifierProvider<DashboardVM>((ref) => DashboardVM());

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../base_viewmodel.dart';

final vmAppsProvider = ChangeNotifierProvider<AppsVM>((ref) => AppsVM());

class AppsVM extends BaseViewModel {
  void pendingToReceived() {
    print('go to pending to receive');
  }

  void placeOrder(){
    print('go to place order');
  }

  void receiving() {
    print('go to receiving');
  }

  void creditNote(){
    print('go to credit note');
  }

  void stockCount(){
    print('go to stock count');
  }

  void discard(){
    print('go to discard');
  }

  void transfer(){
    print('go to transfer');
  }

  void oilControl(){
    print('go to oil control');
  }

  void sdCost(){
    print ('go to S&D Cost');
  }

  void parVariant(){
    print('go to PAR Variant');
  }

  void settings(){
    print('go to settings');
  }
}
