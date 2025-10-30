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
}
