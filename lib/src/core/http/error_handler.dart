import 'package:dio/dio.dart';
import 'package:movie_app/src/core/errors/infrastructure/server_error.dart';

/// {@template error_handler}
/// Maneja la conversión de errores de Dio a ServerError
/// {@endtemplate}
class ErrorHandler {
  const ErrorHandler();

  /// Convierte un DioException a ServerError
  ServerError handle(DioException exception) {
    return switch (exception.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.sendTimeout => _timeoutError(),
      DioExceptionType.connectionError => _connectionError(),
      DioExceptionType.badResponse => _badResponseError(exception.response),
      DioExceptionType.cancel => _cancelError(),
      DioExceptionType.badCertificate => _certificateError(),
      DioExceptionType.unknown => _unknownError(exception.message),
    };
  }

  ServerError _timeoutError() {
    return const ServerError(
      type: ServerErrorType.timeout,
      message: 'La solicitud tardó demasiado tiempo',
    );
  }

  ServerError _connectionError() {
    return const ServerError(
      type: ServerErrorType.network,
      message: 'No se pudo conectar al servidor',
    );
  }

  ServerError _badResponseError(Response? response) {
    final statusCode = response?.statusCode;
    final message = _extractMessage(response?.data);

    return switch (statusCode) {
      400 => ServerError(
        type: ServerErrorType.badRequest,
        statusCode: statusCode,
        message: message ?? 'Solicitud inválida',
      ),
      401 => ServerError(
        type: ServerErrorType.unauthorized,
        statusCode: statusCode,
        message: message ?? 'No autorizado',
      ),
      404 => ServerError(
        type: ServerErrorType.notFound,
        statusCode: statusCode,
        message: message ?? 'Recurso no encontrado',
      ),
      final code? when code >= 500 => ServerError(
        type: ServerErrorType.server,
        statusCode: statusCode,
        message: message ?? 'Error del servidor',
      ),
      _ => ServerError(
        type: ServerErrorType.unknown,
        statusCode: statusCode,
        message: message ?? 'Error desconocido',
      ),
    };
  }

  ServerError _cancelError() {
    return const ServerError(
      type: ServerErrorType.unknown,
      message: 'Solicitud cancelada',
    );
  }

  ServerError _certificateError() {
    return const ServerError(
      type: ServerErrorType.network,
      message: 'Error de certificado SSL',
    );
  }

  ServerError _unknownError(String? message) {
    return ServerError(
      type: ServerErrorType.unknown,
      message: message ?? 'Error desconocido',
    );
  }

  String? _extractMessage(dynamic data) {
    return switch (data) {
      final Map map =>
        map['message'] ??
            map['error'] ??
            map['detail'] ??
            map['error_description'],
      final String text => text,
      _ => null,
    };
  }
}
