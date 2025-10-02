import 'package:movie_app/src/domain/repositories/repositories.dart';

class Config {
  const Config({required this.configRepository, required this.movieRepository});

  final IConfigRepository configRepository;
  final IMovieRepository movieRepository;
}
