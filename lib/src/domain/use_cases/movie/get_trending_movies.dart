import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';
import 'package:movie_app/src/domain/repositories/repositories.dart';

class GetTrendingMoviesUseCase
    extends
        UseCaseWithParams<
          Result<List<Movie>, AppError>,
          GetTrendingMoviesParams
        > {
  final IMovieRepository _movieRepository;

  GetTrendingMoviesUseCase({required IMovieRepository movieRepository})
    : _movieRepository = movieRepository;

  @override
  Future<Result<List<Movie>, AppError>> execute(
    GetTrendingMoviesParams params,
  ) => _movieRepository.getTrendingMovies(params);
}
