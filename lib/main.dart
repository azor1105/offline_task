import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_task/cubit/cubit/currency_cubit.dart';
import 'package:offline_task/data/api/api_client.dart';
import 'package:offline_task/data/api/api_service.dart';
import 'package:offline_task/data/repositories/currency_repository.dart';
import 'package:offline_task/presentation/router/app_router.dart';
import 'package:offline_task/utils/constants/route_names.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CurrencyCubit(
      currencyRepository: CurrencyRepository(
        apiService: ApiService(
          openApiClient: OpenApiClient(),
        ),
      ),
    )..getCurrencies(),
    child: const App(),
  ));
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
