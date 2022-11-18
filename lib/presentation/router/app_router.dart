import 'package:flutter/material.dart';
import 'package:offline_task/presentation/home/home_screen.dart';
import 'package:offline_task/presentation/splash/splash_screen.dart';
import 'package:offline_task/utils/constants/route_names.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (ctx) => const SplashScreen(),
        );
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (ctx) => const HomeScreen(),
        );
    }
    return null;
  }
}
