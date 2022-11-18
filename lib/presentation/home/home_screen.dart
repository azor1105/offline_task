import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_task/cubit/cubit/currency_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Currencies'),
      ),
      body: BlocBuilder<CurrencyCubit, CurrencyState>(
        builder: (context, state) {
          if (state is CurrencyOnProgress) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is CurrencyOnError) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else if (state is CurrencyOnSuccess) {
            return RefreshIndicator(
              child: ListView(
                children: List.generate(
                  state.currencies.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Card(
                      child: ListTile(
                        title: Text(state.currencies[index].title),
                        subtitle: Text(state.currencies[index].code),
                        trailing: Text(state.currencies[index].code),
                      ),
                    ),
                  ),
                ),
              ),
              onRefresh: () async =>
                  context.read<CurrencyCubit>().getCurrencies(),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
