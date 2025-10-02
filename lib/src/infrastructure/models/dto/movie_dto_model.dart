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

  factory MovieDtoModel.fromMap(DataMap map) => MovieDtoModel(
    id: map['id'] as int? ?? 0,
    posterPath: map['poster_path'] as String? ?? '',
    backdropPath: map['backdrop_path'] as String? ?? '',
    releaseDate: map['release_date'] as String? ?? '',
    originalLanguage: map['original_language'] as String? ?? '',
  );

  DataMap toJson() => {
    'id': id,
    'poster_path': posterPath,
    'backdrop_path': backdropPath,
    'release_date': releaseDate,
    'original_language': originalLanguage,
  };
}
