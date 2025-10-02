import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/app.dart';
import 'package:movie_app/config.dart';
import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/core/ui.dart';
import 'package:movie_app/src/infrastructure/datasources/datasources.dart';
import 'package:movie_app/src/infrastructure/repositories/repositories.dart';

void main() async {
  await dotenv.load();

  final httpClient = HttpManager(
    HttpConfig(
      baseUrl: dotenv.env[EnvKeys.apiUrl] ?? '',
      apiKey: dotenv.env[EnvKeys.apiKey] ?? '',
    ),
  );

  runApp(
    App(
      config: Config(
        configRepository: ConfigRepository(
          configApi: ConfigApiRest(client: httpClient),
        ),
        movieRepository: MovieRepository(
          movieApi: MovieApiRest(client: httpClient),
        ),
      ),
    ),
  );
}
