import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';

class GetTrendingMoviesRequestModel extends GetTrendingMoviesParams {
  GetTrendingMoviesRequestModel({required super.timeWindow});

  factory GetTrendingMoviesRequestModel.fromEntity(
    GetTrendingMoviesParams params,
  ) {
    return GetTrendingMoviesRequestModel(timeWindow: params.timeWindow);
  }

  DataMap toMap() => {'time_window': timeWindow.name};
}
