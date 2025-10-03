import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';
import 'package:movie_app/src/infrastructure/datasources/config_api/config_api_rest_endpoints.dart';
import 'package:movie_app/src/infrastructure/datasources/datasources.dart';
import 'package:movie_app/src/infrastructure/models/dto/dto.dart';

class ConfigApiRest implements IConfigApi {
  ConfigApiRest({required HttpManager client}) : _client = client;
  final HttpManager _client;

  @override
  Future<Result<List<Language>, ServerError>> getAvailableLanguages() async {
    try {
      final response = await _client.get<List<dynamic>>(
        ConfigApiRestEndpoints.getLanguages,
      );

      final data = response.data ?? [];

      final langs = data
          .map((l) => LanguageDtoModel.fromMap(l as DataMap? ?? {}))
          .toList();

      return Success(langs);
    } catch (e) {
      return Failure(ServerError(message: e.toString()));
    }
  }
}
