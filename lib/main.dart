import 'package:flutter/material.dart';
import 'package:offline_task/presentation/router/app_router.dart';
import 'package:offline_task/utils/constants/route_names.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: RouteNames.splash,
    );
  }
}
