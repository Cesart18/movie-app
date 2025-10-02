import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';
import 'package:movie_app/src/domain/repositories/repositories.dart';

class GetMovieDetailsUseCase
    extends
        UseCaseWithParams<
          Result<MovieDetails, AppError>,
          GetMovieDetailsParams
        > {
  final IMovieRepository _movieRepository;

  GetMovieDetailsUseCase({required IMovieRepository movieRepository})
    : _movieRepository = movieRepository;
  @override
  Future<Result<MovieDetails, AppError>> execute(
    GetMovieDetailsParams params,
  ) => _movieRepository.getMovieDetails(params);
}
