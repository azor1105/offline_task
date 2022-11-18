import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:offline_task/cubit/connectivity/connectivity_cubit.dart';
import 'package:offline_task/cubit/cubit/currency_cubit.dart';
import 'package:offline_task/utils/constants/route_names.dart';
import 'package:offline_task/utils/icons.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: LottieBuilder.asset(
                  AppIcons.noInternet,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RouteNames.offline);
              },
              child: const Text('Offline'),
            ),
            BlocListener<ConnectivityCubit, ConnectivityState>(
              listener: (context, state) {
                if (state.connectivityResult != ConnectivityResult.none) {
                  Navigator.pop(context);
                  context.read<CurrencyCubit>().getCurrencies();
                }
              },
              child: const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
