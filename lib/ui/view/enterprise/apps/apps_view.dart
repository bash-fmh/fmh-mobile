import 'package:flutter/material.dart';

class AppsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppsViewState();
}

class _AppsViewState extends State<AppsView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Center(
      child: Text('Apps View'),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
