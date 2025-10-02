import 'package:movie_app/src/domain/entities/entities.dart';

class GetTrendingMoviesParams {
  GetTrendingMoviesParams({required this.timeWindow});
  final TimeWindowType timeWindow;
}
