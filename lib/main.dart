import 'package:flutter/material.dart';
import 'package:zesty/config/routes_name.dart';
import 'package:zesty/dependency_injection/service_locator.dart';

import 'config/routes.dart';

final ServiceLocator dependencyInjector = ServiceLocator();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dependencyInjector.serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
