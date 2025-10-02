import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';

abstract class IMovieApi {
  /// Fetches a list of upcoming movies.
  /// Returns a [Result] containing either the list of movies or an error.
  ///
  /// If the operation is successful, the [Result] will contain a [List<Movie>].
  /// If there is an error, the [Result] will contain an [ServerError].
  Future<Result<List<Movie>, ServerError>> getUpcomingMovies();

  /// Fetches a list of trending movies based on the provided parameters.
  /// Returns a [Result] containing either the list of trending movies or an error.
  ///
  /// If the operation is successful, the [Result] will contain a [List<Movie>].
  /// If there is an error, the [Result] will contain an [ServerError].
  Future<Result<List<Movie>, ServerError>> getTrendingMovies(
    GetTrendingMoviesParams params,
  );

  /// Fetches detailed information about a specific movie based on the provided parameters.
  /// Returns a [Result] containing either the movie details or an error.
  ///
  /// If the operation is successful, the [Result] will contain a [MovieDetails].
  /// If there is an error, the [Result] will contain an [ServerError].
  Future<Result<MovieDetails, ServerError>> getMovieDetails(
    GetMovieDetailsParams params,
  );

  /// Fetches a list of videos associated with a specific movie based on the provided parameters.
  /// Returns a [Result] containing either the list of videos or an error.
  ///
  /// If the operation is successful, the [Result] will contain a [List<Video>].
  /// If there is an error, the [Result] will contain an [ServerError
  Future<Result<List<Video>, ServerError>> getMovieVideos(
    GetMovieVideosParams params,
  );
}
