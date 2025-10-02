import 'package:movie_app/src/domain/entities/entities.dart';

class GetTrendingMoviesParams {
  final TimeWindowType timeWindow;

  GetTrendingMoviesParams({required this.timeWindow});
}
