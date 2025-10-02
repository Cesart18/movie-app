import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';
import 'package:movie_app/src/domain/repositories/repositories.dart';

class GetLanguagesUseCase
    extends UseCaseWithoutParams<Result<List<Language>, AppError>> {
  final IConfigRepository _configRepository;

  GetLanguagesUseCase({required IConfigRepository configRepository})
    : _configRepository = configRepository;

  @override
  Future<Result<List<Language>, AppError>> execute() =>
      _configRepository.getAvailableLanguages();
}
