import 'package:flutter/material.dart';
import 'package:fmh_mobile/core/theme/theme_color.dart';

class NotificationDetailContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ThemeColor.floralWhite,
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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: const [
              Text('123'),
              Text('123')
            ],
          ),
        ),
      ),
    );
  }
}
