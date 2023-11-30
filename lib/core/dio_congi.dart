import 'package:dio/dio.dart';

class DioConfiguration {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3))); // With default `Options`.
}
