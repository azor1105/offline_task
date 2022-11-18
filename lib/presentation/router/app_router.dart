import 'package:flutter/material.dart';
import 'package:offline_task/presentation/splash/splash_screen.dart';
import 'package:offline_task/utils/constants/route_names.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (ctx) => const SplashScreen(),
        );
    }
    return null;
  }
}
