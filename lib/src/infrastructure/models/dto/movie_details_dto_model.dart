import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';
import 'package:movie_app/src/infrastructure/models/dto/dto.dart';

class MovieDetailsDtoModel extends MovieDetails {
  const MovieDetailsDtoModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.releaseDate,
    required super.voteAverage,
    required super.voteCount,
    required super.spokenLanguages,
    required super.genres,
  });

  factory MovieDetailsDtoModel.fromMap(DataMap map) => MovieDetailsDtoModel(
    id: map['id'] as int? ?? 0,
    title: map['title'] as String? ?? '',
    overview: map['overview'] as String? ?? '',
    posterPath: map['poster_path'] as String? ?? '',
    backdropPath: map['backdrop_path'] as String? ?? '',
    releaseDate: map['release_date'] as String? ?? '',
    voteAverage: (map['vote_average'] as num?)?.toDouble() ?? 0.0,
    voteCount: map['vote_count'] as int? ?? 0,
    spokenLanguages:
        (map['spoken_languages'] as List<dynamic>?)
            ?.map((e) => LanguageDtoModel.fromMap(e as DataMap))
            .toList() ??
        [],
    genres:
        (map['genres'] as List<dynamic>?)
            ?.map((e) => GenreDtoModel.fromMap(e as DataMap))
            .toList() ??
        [],
  );

  DataMap toJson() => {
    'id': id,
    'title': title,
    'overview': overview,
    'poster_path': posterPath,
    'backdrop_path': backdropPath,
    'release_date': releaseDate,
    'vote_average': voteAverage,
    'vote_count': voteCount,
    'spoken_languages': spokenLanguages
        .map((e) => (e as LanguageDtoModel).toJson())
        .toList(),
    'genres': genres.map((e) => (e as GenreDtoModel).toJson()).toList(),
  };
}
