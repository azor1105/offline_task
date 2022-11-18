import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:offline_task/data/db/cached_nb_model.dart';
import 'package:offline_task/data/db/local_data_base.dart';
import 'package:offline_task/data/models/nb_model.dart';
import 'package:offline_task/data/repositories/currency_repository.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit({required CurrencyRepository currencyRepository})
      : _currencyRepository = currencyRepository,
        super(CurrencyInitial());

  final CurrencyRepository _currencyRepository;

  Future<void> getCurrencies() async {
    emit(CurrencyOnProgress());
    try {
      List<NbModel> currencies = await _currencyRepository.getCurrencies();
      List<CachedCurrencyModel> cachedCurrencies = [];
      for (var currency in currencies) {
        cachedCurrencies.add(
          CachedCurrencyModel(
              cbPrice: currency.cbPrice,
              date: currency.date,
              code: currency.code,
              title: currency.title),
        );
      }
      await LocalDataBase.deleteAllCurrency();
      await LocalDataBase.insertCurrencies(currencies: cachedCurrencies);
      emit(CurrencyOnSuccess(currencies: currencies));
    } catch (e) {
      emit(
        CurrencyOnError(error: e.toString()),
      );
    }
  }
}
