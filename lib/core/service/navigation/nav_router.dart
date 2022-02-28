import 'package:flutter/material.dart';
import 'package:fmh_mobile/ui/view/dashboard/dasboard_view.dart';
import 'package:fmh_mobile/ui/view/splash/splash_view.dart';

class NavRouter {
  static const String initialRoute = '/';
  static const String dashboardRouter = '/dashboard';

  static MaterialPageRoute _pageRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return _pageRoute(SplashView());
      case dashboardRouter:
        return _pageRoute(DashboardView());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
