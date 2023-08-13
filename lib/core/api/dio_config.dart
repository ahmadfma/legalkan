import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'http_interceptor.dart';

final baseOption = BaseOptions(
  baseUrl: 'https://unhas-merdeka-prod.onrender.com',
  responseType: ResponseType.json,
  headers: {
    'requiresToken': true,
    'accept': "application/json",
  }
);

Dio dioConfig() => Dio(baseOption)
  ..interceptors.add(HttpInterceptors())
  ..interceptors.add(PrettyDioLogger(requestBody: true));
