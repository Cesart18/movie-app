import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';

class MovieDtoModel extends Movie {
  const MovieDtoModel({
    required super.id,
    required super.posterPath,
    required super.backdropPath,
    required super.releaseDate,
    required super.originalLanguage,
  });

  factory MovieDtoModel.fromMap(DataMap map) {
    final posterPath = map['poster_path'] as String? ?? '';
    final backdropPath = map['backdrop_path'] as String? ?? '';
    return MovieDtoModel(
      id: map['id'] as int? ?? 0,
      posterPath:
          '${EnvValues.imageBaseUrl}/${Constants.defaultImageSize}/$posterPath',
      backdropPath:
          '${EnvValues.imageBaseUrl}/${Constants.defaultImageSize}/$backdropPath',
      releaseDate: map['release_date'] as String? ?? '',
      originalLanguage: map['original_language'] as String? ?? '',
    );
  }

  DataMap toJson() => {
    'id': id,
    'poster_path': posterPath,
    'backdrop_path': backdropPath,
    'release_date': releaseDate,
    'original_language': originalLanguage,
  };
}
