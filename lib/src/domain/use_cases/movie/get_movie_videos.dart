import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';
import 'package:movie_app/src/domain/repositories/repositories.dart';

class GetMovieVideosUseCase
    extends
        UseCaseWithParams<Result<List<Video>, AppError>, GetMovieVideosParams> {
  GetMovieVideosUseCase({required IMovieRepository movieRepository})
    : _movieRepository = movieRepository;
  final IMovieRepository _movieRepository;

  @override
  Future<Result<List<Video>, AppError>> execute(GetMovieVideosParams params) =>
      _movieRepository.getMovieVideos(params);
}
