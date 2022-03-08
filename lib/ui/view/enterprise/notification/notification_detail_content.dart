import 'package:flutter/material.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';
import 'package:fmh_mobile/ui/view/enterprise/notification/notification_list_data.dart';

class NotificationDetailContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ThemeColor.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: _getBody(),
    );
  }

  Widget _getBody() {
    return Column(
      children: <Widget>[
        _getContent(),
      ],
    );
  }

  Expanded _getContent() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: NotificationListData(),
      ),
    );
  }
}
