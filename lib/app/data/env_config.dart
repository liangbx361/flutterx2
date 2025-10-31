import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static EnvConfig? _instance;

  static void init({
    required String env,
  }) {
    _instance ??= EnvConfig()..env = env;
  }

  static EnvConfig get instance {
    if (_instance == null) {
      throw Exception('EnvConfig must be initialized before usage');
    }
    return _instance!;
  }

  late String env;

  /// Get base URL based on environment
  String get baseUrl {
    final urlFromEnv = dotenv.env['DEV_RUSH_BASE_URL'];
    if (urlFromEnv != null && urlFromEnv.isNotEmpty) {
      return urlFromEnv;
    }
    // Fallback to hardcoded URL if not in .env
    return 'https://api.example.com';
  }
}
