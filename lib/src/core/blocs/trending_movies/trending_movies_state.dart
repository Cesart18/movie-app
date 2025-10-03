part of 'trending_movies_bloc.dart';

enum TrendingMoviesStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == TrendingMoviesStatus.initial;
  bool get isLoading => this == TrendingMoviesStatus.loading;
  bool get isSuccess => this == TrendingMoviesStatus.success;
  bool get isFailure => this == TrendingMoviesStatus.failure;
}

class TrendingMoviesState extends Equatable {
  const TrendingMoviesState({
    this.status = TrendingMoviesStatus.initial,
    this.movies = const <Movie>[],
    this.errorMessage = '',
  });

  final TrendingMoviesStatus status;
  final List<Movie> movies;
  final String errorMessage;

  @override
  List<Object> get props => [status, movies, errorMessage];

  TrendingMoviesState copyWith({
    TrendingMoviesStatus? status,
    List<Movie>? movies,
    String? errorMessage,
  }) {
    return TrendingMoviesState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
