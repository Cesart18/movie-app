abstract class MovieApiRestEndpoints {
  static String getTrendingMovies(String day) => '/trending/movie/$day';
  static const String getUpcomingMovies = '/movie/upcoming';
  static String getMovieDetails(int movieId) => '/movie/$movieId';
  static String getMovieVideos(int movieId) => '/movie/$movieId/videos';
}

abstract class MovieApiRestConstants {
  static String results = 'results';
}
