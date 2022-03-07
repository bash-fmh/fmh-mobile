import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/model/enterprise/mtd_top_model.dart';
import 'package:fmh_mobile/core/service/locator/locator.dart';
import 'package:fmh_mobile/core/service/service.dart';

import '../base_viewmodel.dart';

final vmDashboardProvider =
    ChangeNotifierProvider<DashboardVM>((ref) => DashboardVM());

class DashboardVM extends BaseViewModel {
  MTDType _mtdSelected = MTDType.variance;
  QtyVariance _varianceSelected = QtyVariance.cost;
  MTDTopModelResponse? _mtdTopList;

  final Service _service = locator<ServiceImpl>();

  MTDType get mtdSelected => _mtdSelected;

  QtyVariance get varianceSelected => _varianceSelected;

  MTDTopModelResponse? get mtdTopList => _mtdTopList;

  set mtdSelected(MTDType typeSelected) {
    if (typeSelected != _mtdSelected) {
      _mtdSelected = typeSelected;
      _varianceSelected = QtyVariance.cost;

      notifyListeners();
    }
  }

  set varianceSelected(QtyVariance variance) {
    if (variance != _varianceSelected) {
      _varianceSelected = variance;

      notifyListeners();
    }
  }

  void loadInit() {
    _getMTDTopList();
  }

  Future<void> _getMTDTopList() async {
    try {
      setBusy();
      await Future.delayed(const Duration(seconds: 2)).then((value) async {
        final MTDTopModelResponse response = await _service.getMTDList();
        _mtdTopList = response;
        setIdle();
      });
    } catch (e, s) {
      setError(e, s);
    }
  }
}
