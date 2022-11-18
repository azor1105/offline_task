import 'package:flutter/material.dart';
import 'package:offline_task/presentation/home/home_screen.dart';
import 'package:offline_task/presentation/no_internet/no_internet_screen.dart';
import 'package:offline_task/presentation/offline/offline_screen.dart';
import 'package:offline_task/presentation/splash/splash_screen.dart';
import 'package:offline_task/utils/constants/route_names.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (ctx) => const SplashScreen(),
        );
      case RouteNames.noInternet:
        return MaterialPageRoute(builder: (ctx) => const NoInternetScreen());
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (ctx) => const HomeScreen(),
        );
      case RouteNames.offline:
        return MaterialPageRoute(
          builder: (ctx) => const OfflineScreen(),
        );
      default:
        return null;
    }
  }
}
