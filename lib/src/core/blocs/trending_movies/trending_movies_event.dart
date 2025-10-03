part of 'trending_movies_bloc.dart';

sealed class TrendingMoviesEvent extends Equatable {
  const TrendingMoviesEvent();

  @override
  List<Object?> get props => [];
}

class TrendingMoviesRequested extends TrendingMoviesEvent {
  const TrendingMoviesRequested();
}

class TrendingMoviesFiltered extends TrendingMoviesEvent {
  const TrendingMoviesFiltered({this.language, this.year});

  final String? language;
  final int? year;

  @override
  List<Object?> get props => [language, year];
}
