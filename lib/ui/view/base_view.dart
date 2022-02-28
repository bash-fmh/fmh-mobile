import 'package:flutter/material.dart';

class BaseView extends StatefulWidget {
  final Widget Function(BuildContext context) builder;
  final Function(AppLifecycleState)? didChangeAppLifeCycle;
  final Function()? onInitReady;

  const BaseView({
    required this.builder,
    Key? key,
    this.didChangeAppLifeCycle,
    this.onInitReady,
  }) : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    widget.didChangeAppLifeCycle?.call(state);
    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    widget.onInitReady?.call();
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext ctx) {
    return widget.builder(context);
  }
}
