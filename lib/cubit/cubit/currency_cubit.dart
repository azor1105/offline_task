import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:offline_task/data/models/nb_model.dart';
import 'package:offline_task/data/repositories/currency_repository.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit({required CurrencyRepository currencyRepository})
      : _currencyRepository = currencyRepository,
        super(CurrencyInitial());

  CurrencyRepository _currencyRepository;

  Future<void> getCurrencies() async {
    emit(CurrencyOnProgress());
    try {
      List<NbModel> currencies = await _currencyRepository.getCurrencies();
      emit(CurrencyOnSuccess(currencies: currencies));
    } catch (e) {
      emit(
        CurrencyOnError(error: e.toString()),
      );
    }
  }
}
