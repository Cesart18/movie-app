part of 'package:movie_app/src/presentation/movie_details/base/movie_details_page.dart';

enum _MovieDetailsStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == _MovieDetailsStatus.initial;
  bool get isLoading => this == _MovieDetailsStatus.loading;
  bool get isSuccess => this == _MovieDetailsStatus.success;
  bool get isFailure => this == _MovieDetailsStatus.failure;
}

/// {@template movie_details_state}
/// _MovieDetailsState description
/// {@endtemplate}
class _MovieDetailsState extends Equatable {
  /// {@macro movie_details_state}
  const _MovieDetailsState({
    this.status = _MovieDetailsStatus.initial,
    this.errorMessage = '',
    this.currentMovie,
  });

  /// Status of the state
  final _MovieDetailsStatus status;
  final MovieDetails? currentMovie;
  final String errorMessage;

  @override
  List<Object?> get props => [status, currentMovie, errorMessage];

  /// Creates a copy of the current _MovieDetailsState with property changes
  _MovieDetailsState copyWith({
    _MovieDetailsStatus? status,
    MovieDetails? currentMovie,
    String? errorMessage,
  }) {
    return _MovieDetailsState(
      status: status ?? this.status,
      currentMovie: currentMovie ?? this.currentMovie,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
