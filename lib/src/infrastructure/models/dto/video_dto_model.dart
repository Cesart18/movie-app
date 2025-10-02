import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';

class VideoDtoModel extends Video {
  const VideoDtoModel({
    required super.id,
    required super.key,
    required super.name,
    required super.site,
    required super.type,
    required super.size,
  });

  factory VideoDtoModel.fromMap(DataMap map) => VideoDtoModel(
    id: map['id'] as String? ?? '',
    key: map['key'] as String? ?? '',
    name: map['name'] as String? ?? '',
    site: map['site'] as String? ?? '',
    type: map['type'] as String? ?? '',
    size: map['size'] as int? ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'key': key,
    'name': name,
    'site': site,
    'type': type,
    'size': size,
  };
}
