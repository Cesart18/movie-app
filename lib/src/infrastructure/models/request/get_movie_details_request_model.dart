import 'package:movie_app/src/domain/entities/entities.dart';

class GetMovieDetailsRequestModel extends GetMovieDetailsParams {
  GetMovieDetailsRequestModel({required super.movieId});

  factory GetMovieDetailsRequestModel.fromEntity(GetMovieDetailsParams params) {
    return GetMovieDetailsRequestModel(movieId: params.movieId);
  }

  int toPathParameters() => movieId;
}
