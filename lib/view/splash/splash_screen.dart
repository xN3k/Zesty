import 'package:flutter/material.dart';
import 'package:zesty/services/splash_service/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    _splashServices.showSplash(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Zesty",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
