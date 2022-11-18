import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_task/cubit/connectivity/connectivity_cubit.dart';
import 'package:offline_task/cubit/cubit/currency_cubit.dart';
import 'package:offline_task/data/db/local_data_base.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Offline page"),
        ),
        body: Column(
          children: [
            BlocListener<ConnectivityCubit, ConnectivityState>(
              listener: (context, state) {
                if (state.connectivityResult != ConnectivityResult.none) {
                  Navigator.pop(context);
                  context.read<CurrencyCubit>().getCurrencies();
                }
              },
              child: const SizedBox(),
            ),
            Expanded(
              child: FutureBuilder(
                future: LocalDataBase.getAllCachedCurrency(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      children: List.generate(
                        snapshot.data!.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Card(
                            child: ListTile(
                              title: Text(snapshot.data![index].title),
                              subtitle: Text(snapshot.data![index].code),
                              trailing: Text(snapshot.data![index].code),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
