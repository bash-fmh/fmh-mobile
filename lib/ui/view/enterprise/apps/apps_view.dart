import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmh_mobile/ui/view/base_view.dart';
import 'package:fmh_mobile/ui/view/enterprise/apps/custom_app_bar.dart';

import 'detail_content.dart';
import 'header_content.dart';

class AppsView extends ConsumerStatefulWidget {
  @override
  _AppsViewState createState() => _AppsViewState();
}

class _AppsViewState extends ConsumerState<AppsView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BaseView(
      onInitReady: () {},
      builder: (context) {
        return _getBody();
      },
    );
  }

  Widget _getBody() {
    return Column(
      children: <Widget>[
        CustomAppBar(),
        _getContent(),
      ],
    );
  }

  Expanded _getContent() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderContent(),
            DetailContent(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
