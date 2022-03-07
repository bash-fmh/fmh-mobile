import 'package:flutter/material.dart';
import 'package:fmh_mobile/ui/view/enterprise/landing/landing_view.dart';
import 'package:fmh_mobile/ui/view/login/login_view.dart';
import 'package:fmh_mobile/ui/view/splash/splash_view.dart';

class NavRouter {
  NavRouter._();

  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String landingRoute = '/dashboard';

  static MaterialPageRoute _pageRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return _pageRoute(SplashView());
      case landingRoute:
        return _pageRoute(LandingView());
      case loginRoute:
        return _pageRoute(LoginView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
