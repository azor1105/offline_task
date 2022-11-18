import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:offline_task/presentation/home/home_screen.dart';
import 'package:offline_task/utils/icons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: AppIcons.appLogo,
      nextScreen: const HomeScreen(),
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
