import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/core/constant/constant_asset.dart';
import 'package:fmh_mobile/core/model/enterprise/notification_model.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';
import 'package:fmh_mobile/core/theme/google_font_syle.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/core/viewmodel/enterprise/notification_vm.dart';

class NotificationListData extends StatelessWidget {
  const NotificationListData({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final List<NotificationDetail> notificationList  =
          ref.watch(vmNotificationProvider.select((vm) => vm.notificationList));

        return RefreshIndicator(
          onRefresh: () => ref.read<NotificationVM>(vmNotificationProvider).refreshNotification(),
          child: _getNotificationList(ref, notificationList));
      }
    );
  }

  Widget _getNotificationList(WidgetRef ref, List<NotificationDetail> notificationList) {
    if(notificationList.isNotEmpty){
      return _getNotificationNotEmpty(notificationList);
    }else{
       return _getNotificationIsEmpty();
    }
  }

  ListView _getNotificationIsEmpty() {
    return ListView(
      children: [
        Column(
         children: [
           Image.asset(
             ConstantAsset.emptyNotification
           ),
           Text(
             getLocalization.noResult,
             textAlign: TextAlign.center,
             style: GoogleStyle.bodyText.copyWith(
               fontSize: 30,
               color: ThemeColor.sunny500
            ),
           )
         ],
       )
      ]
    );
  }

  ListView _getNotificationNotEmpty(List<NotificationDetail> notificationList) {
    return ListView.builder(
        itemCount: notificationList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                _getHeader(notificationList, index),
                __getContent(notificationList, index)
              ],
            ),
          );
        }
      );
  }

  Row _getHeader(List<NotificationDetail> notificationList, int index) {
    return Row(
      children: [
        _getNotificationTitle(notificationList, index),
        _getNotificationDateTime(notificationList, index)
      ]
    );
  }

  Expanded _getNotificationDateTime(List<NotificationDetail> notificationList, int index) {
    return Expanded(
        flex: 4,
        child: Text(
          '${notificationList[index].date} ${notificationList[index].time}',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: GoogleStyle.bodyText
          .copyWith(color: ThemeColor.gray500, fontSize: 12),
        ),
      );
  }

  Expanded _getNotificationTitle(List<NotificationDetail> notificationList, int index) {
    return Expanded(
        flex: 6,
        child: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Text(
            notificationList[index].title,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: GoogleStyle.bodyText
            .copyWith(color: ThemeColor.black, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
      );
  }

  Column __getContent(List<NotificationDetail> notificationList, int index) {
    return Column(
      children: [
        Text(
          notificationList[index].content,
          style: GoogleStyle.bodyText
          .copyWith(color: ThemeColor.black, fontSize: 12),
        )
      ],
    );
  }
}