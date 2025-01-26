import 'package:flutter/material.dart';
import 'package:zesty/config/routes_name.dart';
import 'package:zesty/models/product/product_model.dart';
import 'package:zesty/view/product/product_detail_screen.dart';
import 'package:zesty/view/view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RoutesName.productDetail:
        Products argument = settings.arguments as Products;
        return MaterialPageRoute(
            builder: (context) => ProductDetailScreen(productModel: argument));
      default:
        return MaterialPageRoute(
          builder: (context) => Center(
            child: Text('No route Generated'),
          ),
        );
    }
  }
}
