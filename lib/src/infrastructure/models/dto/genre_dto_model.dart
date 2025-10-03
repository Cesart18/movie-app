import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';

class GenreDtoModel extends Genre {
  const GenreDtoModel({required super.id, required super.name});

  factory GenreDtoModel.fromMap(DataMap map) => GenreDtoModel(
    id: map['id'] as int? ?? 0,
    name: map['name'] as String? ?? '',
  );

  DataMap toJson() => {'id': id, 'name': name};
}
