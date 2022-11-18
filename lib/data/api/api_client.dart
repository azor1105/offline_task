import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class OpenApiClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://nbu.uz/en/exchange-rates/json/',
      connectTimeout: 35000,
      receiveTimeout: 33000,
    ),
  );

  OpenApiClient() {
    dio.interceptors.add(
      (InterceptorsWrapper(
        onError: (error, handler) async {
          debugPrint('!!!!!!!!!! DIO ON ERROR !!!!!!!!!!');
          if (error.response?.statusCode == 401) {
            debugPrint("TOKEN EXPIRED");
          }
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint('*************** DIO ON REQUEST ***************');
          requestOptions.headers["Accept"] = "application/json";
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint('*************** DIO ON RESPONSE ***************');
          return handler.next(response);
        },
      )),
    );
  }
}
