part of 'currency_cubit.dart';

@immutable
abstract class CurrencyState {}

class CurrencyInitial extends CurrencyState {}

class CurrencyOnSuccess extends CurrencyState {
  final List<NbModel> currencies;
  CurrencyOnSuccess({required this.currencies});
}

class CurrencyOnProgress extends CurrencyState {}

class CurrencyOnError extends CurrencyState {
  CurrencyOnError({this.error = ''});
  final String error;
}
