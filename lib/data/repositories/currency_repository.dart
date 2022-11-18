import 'package:offline_task/data/api/api_service.dart';
import 'package:offline_task/data/models/nb_model.dart';

class CurrencyRepository {
  CurrencyRepository({required ApiService apiService})
      : _apiService = apiService;

  Future<List<NbModel>> getCurrencies() async {
    var response = await _apiService.getCurrencies();
    return (response.data as List?)
            ?.map((currency) => NbModel.fromJson(currency))
            .toList() ??
        [];
  }

  final ApiService _apiService;
}
