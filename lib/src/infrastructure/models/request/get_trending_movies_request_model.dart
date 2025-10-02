import 'package:movie_app/src/domain/entities/entities.dart';
import 'package:movie_app/src/infrastructure/models/enums/enums.dart';

class GetTrendingMoviesRequestModel extends GetTrendingMoviesParams {
  GetTrendingMoviesRequestModel({required super.timeWindow});

  factory GetTrendingMoviesRequestModel.fromEntity(
    GetTrendingMoviesParams params,
  ) {
    return GetTrendingMoviesRequestModel(timeWindow: params.timeWindow);
  }

  /// Devuelve los parámetros para el path de la API
  String toPathParameters() =>
      TimeWindowTypeModel.fromEntity(timeWindow)?.value ?? '';
}
