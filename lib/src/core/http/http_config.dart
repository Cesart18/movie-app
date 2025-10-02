import 'package:dio/dio.dart';

/// {@template http_config}
/// Configuración para HttpManager
/// {@endtemplate}
class HttpConfig {
  final String baseUrl;
  final String apiKey;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final Map<String, dynamic> headers;

  const HttpConfig({
    required this.baseUrl,
    required this.apiKey,
    this.connectTimeout = const Duration(seconds: 30),
    this.receiveTimeout = const Duration(seconds: 30),
    this.headers = const {},
  });

  /// Crea las BaseOptions para Dio
  BaseOptions toBaseOptions() {
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $apiKey',
        ...headers,
      },
    );
  }
}
