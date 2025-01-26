import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zesty/config/routes_name.dart';

class SplashServices {
  void showSplash(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.home, (route) => false));
  }
}
