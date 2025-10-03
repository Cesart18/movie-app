import 'package:movie_app/src/domain/repositories/repositories.dart';

class Config {
  const Config({required this.movieRepository});

  final IMovieRepository movieRepository;
}
