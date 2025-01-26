import 'package:flutter/material.dart';
import 'package:zesty/config/routes_name.dart';
import 'package:zesty/view/view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Center(
            child: Text('No route Generated'),
          ),
        );
    }
  }
}
