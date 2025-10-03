import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';
import 'package:movie_app/src/domain/repositories/repositories.dart';
import 'package:movie_app/src/infrastructure/datasources/datasources.dart';

class MovieRepository implements IMovieRepository {
  MovieRepository({required IMovieApi movieApi}) : _movieApi = movieApi;
  final IMovieApi _movieApi;

  @override
  Future<Result<MovieDetails, AppError>> getMovieDetails(
    GetMovieDetailsParams params,
  ) async {
    final result = await _movieApi.getMovieDetails(params);

    if (result is Failure) {
      return Failure(AppError.fromServerError(result.error!));
    }

    return Success(result.data!);
  }

  @override
  Future<Result<List<Video>, AppError>> getMovieVideos(
    GetMovieVideosParams params,
  ) async {
    final result = await _movieApi.getMovieVideos(params);

    if (result is Failure) {
      return Failure(AppError.fromServerError(result.error!));
    }

    return Success(result.data!);
  }

  @override
  Future<Result<List<Movie>, AppError>> getTrendingMovies(
    GetTrendingMoviesParams params,
  ) async {
    final result = await _movieApi.getTrendingMovies(params);

    if (result is Failure) {
      return Failure(AppError.fromServerError(result.error!));
    }

    return Success(result.data!);
  }

  @override
  Future<Result<List<Movie>, AppError>> getUpcomingMovies() async {
    final result = await _movieApi.getUpcomingMovies();

    if (result is Failure) {
      return Failure(AppError.fromServerError(result.error!));
    }

    return Success(result.data!);
  }
}
