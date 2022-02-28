import 'dart:async';
import 'core/constant/enum.dart';
import 'main_common.dart';

Future<void> main() async {
  await mainCommon(
    AppEnvironment.prod,
  );
}