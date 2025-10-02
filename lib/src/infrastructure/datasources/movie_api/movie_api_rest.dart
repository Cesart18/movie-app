import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';
import 'package:movie_app/src/infrastructure/datasources/datasources.dart';
import 'package:movie_app/src/infrastructure/datasources/movie_api/movie_api_rest_endpoints.dart';

import '../../models/models.dart';

class MovieApiRest implements IMovieApi {
  final HttpManager _client;

  MovieApiRest({required HttpManager client}) : _client = client;

  @override
  Future<Result<MovieDetails, ServerError>> getMovieDetails(
    GetMovieDetailsParams params,
  ) async {
    final request = GetMovieDetailsRequestModel.fromEntity(params);

    try {
      final response = await _client.get(
        MovieApiRestEndpoints.getMovieDetails(request.toPathParameters()),
      );

      final data = response.data as DataMap? ?? {};

      final movieDetails = MovieDetailsDtoModel.fromMap(data);

      return Success(movieDetails);
    } catch (e) {
      return Failure(
        ServerError(message: e.toString(), type: ServerErrorType.unknown),
      );
    }
  }

  @override
  Future<Result<List<Video>, ServerError>> getMovieVideos(
    GetMovieVideosParams params,
  ) async {
    final request = GetMovieVideosRequestModel.fromEntity(params);

    try {
      final response = await _client.get(
        MovieApiRestEndpoints.getMovieVideos(request.toPathParameters()),
      );

      final data = response.data as DataMap? ?? {};
      final results =
          data[MovieApiRestConstants.results] as List<dynamic>? ?? [];

      final videos = results
          .map((v) => VideoDtoModel.fromMap(v as DataMap? ?? {}))
          .toList();

      return Success(videos);
    } catch (e) {
      return Failure(
        ServerError(message: e.toString(), type: ServerErrorType.unknown),
      );
    }
  }

  @override
  Future<Result<List<Movie>, ServerError>> getTrendingMovies(
    GetTrendingMoviesParams params,
  ) async {
    final request = GetTrendingMoviesRequestModel.fromEntity(params);

    try {
      final response = await _client.get(
        MovieApiRestEndpoints.getTrendingMovies(request.toPathParameters()),
      );

      final data = response.data as DataMap? ?? {};
      final results =
          data[MovieApiRestConstants.results] as List<dynamic>? ?? [];

      final movies = results
          .map((m) => MovieDtoModel.fromMap(m as DataMap? ?? {}))
          .toList();

      return Success(movies);
    } catch (e) {
      return Failure(
        ServerError(message: e.toString(), type: ServerErrorType.unknown),
      );
    }
  }

  @override
  Future<Result<List<Movie>, ServerError>> getUpcomingMovies() async {
    try {
      final response = await _client.get(
        MovieApiRestEndpoints.getUpcomingMovies,
      );

      final data = response.data as DataMap;
      final results =
          data[MovieApiRestConstants.results] as List<dynamic>? ?? [];

      final movies = results
          .map((m) => MovieDtoModel.fromMap(m as DataMap? ?? {}))
          .toList();

      return Success(movies);
    } catch (e) {
      return Failure(
        ServerError(message: e.toString(), type: ServerErrorType.unknown),
      );
    }
  }
}
