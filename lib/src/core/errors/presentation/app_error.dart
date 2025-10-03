import 'package:movie_app/src/core/errors/infrastructure/server_error.dart'
    as infra;
import 'package:movie_app/src/core/foundation.dart';

/// {@template app_error}
/// Presentation-layer error shown in the UI.
/// Holds a user-friendly message.
/// {@endtemplate}
sealed class AppError extends BaseError {
  const AppError({required this.message, this.title});

  /// Factory constructor that converts an [infra.ServerError] to an [AppError]
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

  /// Error message to display to the user
  final String message;

  /// Optional error title
  final String? title;
}

/// Network/connection error
class NetworkError extends AppError {
  const NetworkError({
    super.title = 'Error de conexión',
    super.message =
        'No se pudo conectar al servidor. Verifica tu conexión a internet.',
  });
}

/// Timeout error
class TimeoutError extends AppError {
  const TimeoutError({
    super.title = 'Tiempo agotado',
    super.message = 'La solicitud tardó demasiado. Intenta nuevamente.',
  });
}

/// Server error (500, 502, 503, etc.)
class InternalServerError extends AppError {
  const InternalServerError({
    super.title = 'Error del servidor',
    super.message = 'Ocurrió un problema en el servidor. Intenta más tarde.',
  });
}

/// Unauthorized error (401)
class UnauthorizedError extends AppError {
  const UnauthorizedError({
    super.title = 'No autorizado',
    super.message = 'Tu sesión ha expirado. Inicia sesión nuevamente.',
  });
}

/// Resource not found error (404)
class NotFoundError extends AppError {
  const NotFoundError({
    super.title = 'No encontrado',
    super.message = 'El contenido que buscas no existe.',
  });
}

/// Validation/invalid data error (400)
class ValidationError extends AppError {
  const ValidationError({
    super.title = 'Error de validación',
    super.message = 'Los datos proporcionados no son válidos.',
  });
}

/// Generic/unknown error
class UnknownError extends AppError {
  const UnknownError({
    super.title = 'Error inesperado',
    super.message = 'Ocurrió un error inesperado. Intenta nuevamente.',
  });
}
