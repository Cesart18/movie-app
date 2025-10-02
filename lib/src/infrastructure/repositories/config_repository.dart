import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';
import 'package:movie_app/src/domain/repositories/repositories.dart';
import 'package:movie_app/src/infrastructure/datasources/datasources.dart';

class ConfigRepository implements IConfigRepository {
  ConfigRepository({required IConfigApi configApi}) : _configApi = configApi;
  final IConfigApi _configApi;

  @override
  Future<Result<List<Language>, AppError>> getAvailableLanguages() async {
    final result = await _configApi.getAvailableLanguages();

    if (result is Failure) {
      return Failure(AppError.fromServerError(result.error!));
    }

    return Success(result.data!);
  }
}
