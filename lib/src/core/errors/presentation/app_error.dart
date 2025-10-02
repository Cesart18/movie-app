import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/core/errors/infrastructure/server_error.dart'
    as infra;

/// {@template app_error}
/// Error de presentación que se muestra en la UI.
/// Contiene un mensaje amigable para el usuario.
/// {@endtemplate}
sealed class AppError extends BaseError {
  const AppError({required this.message, this.title});

  /// Mensaje de error para mostrar al usuario
  final String message;

  /// Título opcional del error
  final String? title;

  /// Factory constructor que convierte un [infra.ServerError] a [AppError]
  factory AppError.fromServerError(infra.ServerError error) {
    switch (error.type) {
      case infra.ServerErrorType.network:
        return const NetworkError();

      case infra.ServerErrorType.timeout:
        return const TimeoutError();

      case infra.ServerErrorType.server:
        return InternalServerError(
          message:
              error.message ??
              'Ocurrió un problema en el servidor. Intenta más tarde.',
        );

      case infra.ServerErrorType.unauthorized:
        return const UnauthorizedError();

      case infra.ServerErrorType.notFound:
        return const NotFoundError();

      case infra.ServerErrorType.badRequest:
        return ValidationError(
          message: error.message ?? 'Los datos proporcionados no son válidos.',
        );

      case infra.ServerErrorType.unknown:
        return UnknownError(
          message:
              error.message ??
              'Ocurrió un error inesperado. Intenta nuevamente.',
        );
    }
  }
}

/// Error de red/conexión
class NetworkError extends AppError {
  const NetworkError({
    super.title = 'Error de conexión',
    super.message =
        'No se pudo conectar al servidor. Verifica tu conexión a internet.',
  });
}

/// Error de timeout
class TimeoutError extends AppError {
  const TimeoutError({
    super.title = 'Tiempo agotado',
    super.message = 'La solicitud tardó demasiado. Intenta nuevamente.',
  });
}

/// Error de servidor (500, 502, 503, etc.)
class InternalServerError extends AppError {
  const InternalServerError({
    super.title = 'Error del servidor',
    super.message = 'Ocurrió un problema en el servidor. Intenta más tarde.',
  });
}

/// Error de no autorizado (401)
class UnauthorizedError extends AppError {
  const UnauthorizedError({
    super.title = 'No autorizado',
    super.message = 'Tu sesión ha expirado. Inicia sesión nuevamente.',
  });
}

/// Error de recurso no encontrado (404)
class NotFoundError extends AppError {
  const NotFoundError({
    super.title = 'No encontrado',
    super.message = 'El contenido que buscas no existe.',
  });
}

/// Error de validación/datos incorrectos (400)
class ValidationError extends AppError {
  const ValidationError({
    super.title = 'Error de validación',
    super.message = 'Los datos proporcionados no son válidos.',
  });
}

/// Error genérico/desconocido
class UnknownError extends AppError {
  const UnknownError({
    super.title = 'Error inesperado',
    super.message = 'Ocurrió un error inesperado. Intenta nuevamente.',
  });
}
