import 'package:flutter/material.dart';
import '../screen/home/home_screen.dart';
import '../screen/splash/splash_screen.dart';

class AppRoutes {
  static const String splashPath = '/splash';
  static const String homePath = '/home';

  static final Map<String, WidgetBuilder> routes = {
    splashPath: (context) => SplashScreen(),
    homePath: (context) => HomeScreen(),
  };
}