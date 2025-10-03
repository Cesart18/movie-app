import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';

// ignore: one_member_abstracts
abstract class IConfigRepository {
  /// Fetches the list of available languages from the configuration source.
  /// Returns a [Result] containing either the list of languages or an error.
  /// In case of failure, it returns an [AppError].
  Future<Result<List<Language>, AppError>> getAvailableLanguages();
}
