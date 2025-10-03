import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvKeys {
  static const String apiKey = 'API_KEY';
  static const String apiUrl = 'API_URL';
  static const String imageBaseUrl = 'IMAGE_BASE_URL';
}

class EnvValues {
  static String apiKey = dotenv.env[EnvKeys.apiKey] ?? '';
  static String apiUrl = dotenv.env[EnvKeys.apiUrl] ?? '';
  static String imageBaseUrl = dotenv.env[EnvKeys.imageBaseUrl] ?? '';
}
