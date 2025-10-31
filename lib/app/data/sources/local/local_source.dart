/// Local storage interface for app configuration and cache
abstract class LocalSource {
  /// Get configuration value for the given key
  dynamic getConfig(String key);

  /// Save configuration value for the given key
  Future<void> saveConfig(String key, dynamic value);

  /// Delete configuration for the given key
  Future<void> deleteConfig(String key);
}
