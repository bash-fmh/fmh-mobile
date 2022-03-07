import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/model/enterprise/notification_model.dart';
import 'package:fmh_mobile/core/service/locator/locator.dart';
import 'package:fmh_mobile/core/service/service.dart';
import 'package:fmh_mobile/core/viewmodel/base_viewmodel.dart';

final vmNotificationProvider =
    ChangeNotifierProvider<NotificationVM>((ref) => NotificationVM());

class NotificationVM extends BaseViewModel{

  final Service _service = locator<ServiceImpl>();

  List<NotificationDetail> notificationList = [];

  void loadInit() {
    _getNotificationList();
  }

  Future<void> _getNotificationList() async {
    try {
      setBusy();
      await Future.delayed(const Duration(seconds: 2)).then((value) async {
        final NotificationModelResponse response = await _service.getNotificationList();
        notificationList = response.data;
        setIdle();
      });
    } catch (e, s) {
      setError(e, s);
    }
  }

  Future<void> refreshNotification() async{
    try {
      await Future.delayed(const Duration(seconds: 2)).then((value) async {
        final NotificationModelResponse response = await _service.getNotificationList();
        notificationList = response.data;
        notifyListeners();
      });
    } catch (e, s) {
      setError(e, s);
    }
  }
}