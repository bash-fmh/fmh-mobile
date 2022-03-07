import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/constant/strings_constant.dart';
import 'core/constant/theme_data.dart';
import 'core/service/localization/localization_service.dart';
import 'core/service/navigation/nav_router.dart';
import 'core/service/navigation/navigation_service.dart';
import 'ui/view/base_view.dart';
import 'ui/view/splash/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
        enabled: kDebugMode,
        builder: (_) {
          return BaseView(
            onInitReady: () async =>
                localizationService.onLocaleChangedCallback = _onLocaleChanged,
            builder: (context) => MaterialApp(
              title: ConstantStrings.appName,
              theme: defaultThemeData,
              onGenerateRoute: NavRouter.generateRoute,
              navigatorKey: navigationService.navigationKey,
              home: SplashView(),
              initialRoute: NavRouter.initialRoute,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: localizationService.supportedLocales(),
            ),
          );
        });
  }

  dynamic _onLocaleChanged() {}
}
