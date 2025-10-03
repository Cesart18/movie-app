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
    this.filteredMovies = const <Movie>[],
    this.selectedLanguage,
    this.selectedYear,
    this.errorMessage = '',
  });

  final TrendingMoviesStatus status;
  final List<Movie> movies;
  final List<Movie> filteredMovies;
  final String? selectedLanguage;
  final int? selectedYear;
  final String errorMessage;

  @override
  List<Object?> get props => [
    status,
    movies,
    filteredMovies,
    selectedLanguage,
    selectedYear,
    errorMessage,
  ];

  TrendingMoviesState copyWith({
    TrendingMoviesStatus? status,
    List<Movie>? movies,
    List<Movie>? filteredMovies,
    String? selectedLanguage,
    int? selectedYear,
    String? errorMessage,
    bool clearLanguage = false,
    bool clearYear = false,
  }) {
    return TrendingMoviesState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      filteredMovies: filteredMovies ?? this.filteredMovies,
      selectedLanguage: clearLanguage
          ? null
          : (selectedLanguage ?? this.selectedLanguage),
      selectedYear: clearYear ? null : (selectedYear ?? this.selectedYear),
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
