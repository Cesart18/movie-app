import 'package:movie_app/src/core/foundation.dart';

/// {@template server_error}
/// Error que ocurre en la capa de infraestructura (HTTP, dio, etc.)
/// {@endtemplate}
class ServerError extends BaseError {
  const ServerError({
    this.statusCode,
    this.message,
    this.type = ServerErrorType.unknown,
  });

  /// Código de estado HTTP (si aplica)
  final int? statusCode;

  /// Mensaje de error del servidor
  final String? message;

  /// Tipo de error del servidor
  final ServerErrorType type;

  @override
  String toString() {
    return 'ServerError(type: $type, statusCode: $statusCode, message: $message)';
  }
}

/// Tipos de errores del servidor
enum ServerErrorType {
  /// Error de red/conexión
  network,

  /// Timeout
  timeout,

  /// Error del servidor (5xx)
  server,

  /// No autorizado (401)
  unauthorized,

  /// No encontrado (404)
  notFound,

  /// Error de validación (400)
  badRequest,

  /// Error desconocido
  unknown,
}
