import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constant/enum.dart';
import 'core/network/base_url.dart';
import 'core/service/flavor_manager.dart';
import 'core/service/localization/localization_service.dart';
import 'core/service/locator/locator.dart';
import 'main.dart';

Future<void> mainCommon(AppEnvironment env) async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Register all services before the app starts
    setupLocator();
    FlavorManager(
      env: env,
      settings: FlavorSettings(
        baseUrl: baseMapUrl[env]!,
      ),
    );
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light));

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await localizationService.init().then((_) {
      runApp(
        const ProviderScope(child: MyApp()),
      );
    });
  }, (e, s) {
    print('caught from runZonedGuarded $e $s');
  });
}
