import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';

class LanguageDtoModel extends Language {
  const LanguageDtoModel({required super.iso6391, required super.englishName});

  factory LanguageDtoModel.fromMap(DataMap map) => LanguageDtoModel(
    iso6391: map['iso_639_1'] as String? ?? '',
    englishName: map['english_name'] as String? ?? '',
  );

  DataMap toJson() => {'iso_639_1': iso6391, 'english_name': englishName};
}
