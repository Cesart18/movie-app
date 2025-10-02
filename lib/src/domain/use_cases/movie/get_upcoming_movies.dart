import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';
import 'package:movie_app/src/domain/repositories/repositories.dart';

class GetUpcomingMoviesUseCase
    extends UseCaseWithoutParams<Result<List<Movie>, AppError>> {
  final IMovieRepository _movieRepository;

  GetUpcomingMoviesUseCase({required IMovieRepository movieRepository})
    : _movieRepository = movieRepository;

  @override
  Future<Result<List<Movie>, AppError>> execute() =>
      _movieRepository.getUpcomingMovies();
}
