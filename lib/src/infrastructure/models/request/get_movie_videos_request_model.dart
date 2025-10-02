import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';

class GetMovieVideosRequestModel extends GetMovieVideosParams {
  GetMovieVideosRequestModel({required super.movieId});

  factory GetMovieVideosRequestModel.fromEntity(GetMovieVideosParams params) {
    return GetMovieVideosRequestModel(movieId: params.movieId);
  }

  DataMap toMap() => {'movie_id': movieId};
}
