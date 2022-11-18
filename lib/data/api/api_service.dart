import 'dart:io';
import 'package:dio/dio.dart';
import 'package:offline_task/data/api/api_client.dart';

class ApiService {
  ApiService({required OpenApiClient openApiClient})
      : _openApiClient = openApiClient;

  Future<Response> getCurrencies() async {
    try {
      var response =
          await _openApiClient.dio.get(_openApiClient.dio.options.baseUrl);
      if (response.statusCode == HttpStatus.ok) {
        return response;
      } else {
        throw Exception();
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  final OpenApiClient _openApiClient;
}
