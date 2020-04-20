import 'dart:io';

import 'package:dio/dio.dart';

class ApiClient {
  ApiClient() {
    initClient();
  }

  final String baseUrl = 'https://www.mocky.io';
  Dio dio;
  BaseOptions _baseOptions;

  //configuring Dio
  initClient() async {
    _baseOptions = new BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 30000,
        receiveTimeout: 1000000,
        contentType: ContentType.json,
        followRedirects: true,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
        responseType: ResponseType.json,
        receiveDataWhenStatusError: true);

    dio = Dio(_baseOptions);

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions reqOptions) {
        return reqOptions;
      },
      onError: (DioError dioError) {
        return dioError.response;
      },
    ));
  }

  // fetch restaurant's details
  Future<Response> getRestaurantDetails() async {
    return dio.get("/v2/5dfccffc310000efc8d2c1ad");
  }
}
