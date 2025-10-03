part of 'upcoming_movies_bloc.dart';

enum UpcomingMoviesStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == UpcomingMoviesStatus.initial;
  bool get isLoading => this == UpcomingMoviesStatus.loading;
  bool get isSuccess => this == UpcomingMoviesStatus.success;
  bool get isFailure => this == UpcomingMoviesStatus.failure;
}

class UpcomingMoviesState extends Equatable {
  const UpcomingMoviesState({
    this.status = UpcomingMoviesStatus.initial,
    this.movies = const <Movie>[],
    this.errorMessage = '',
  });

  final UpcomingMoviesStatus status;
  final String errorMessage;
  final List<Movie> movies;

  @override
  List<Object> get props => [status, movies, errorMessage];

  UpcomingMoviesState copyWith({
    UpcomingMoviesStatus? status,
    List<Movie>? movies,
    String? errorMessage,
  }) => UpcomingMoviesState(
    status: status ?? this.status,
    movies: movies ?? this.movies,
    errorMessage: errorMessage ?? this.errorMessage,
  );
}
