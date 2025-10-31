import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'local_source.dart';

/// Hive implementation of LocalSource
///
/// Uses hive_ce for local storage with a single box 'app_config'
class HiveLocalSource implements LocalSource {
  static const String _boxName = 'app_config';
  Box<dynamic>? _box;
  bool _initialized = false;

  /// Initialize Hive storage. Must be called before any operations.
  /// Call this in app startup (main.dart or init.dart)
  Future<void> init() async {
    if (_initialized && _box != null && _box!.isOpen) {
      return;
    }

    try {
      // Initialize Hive with proper directory
      final appDocDir = await getApplicationDocumentsDirectory();
      Hive.init(appDocDir.path);

      _box = await Hive.openBox(_boxName);
      _initialized = true;
    } catch (e) {
      if (kDebugMode) {
        print('HiveLocalSource init error: $e');
      }
      rethrow;
    }
  }

  /// Ensure box is initialized
  void _ensureInitialized() {
    if (!_initialized || _box == null || !_box!.isOpen) {
      throw StateError('HiveLocalSource not initialized. Call init() first.');
    }
  }

  @override
  dynamic getConfig(String key) {
    _ensureInitialized();
    final value = _box!.get(key);

    // If stored as JSON string, try to decode
    if (value is String) {
      try {
        return jsonDecode(value);
      } catch (_) {
        return value;
      }
    }

    return value;
  }

  @override
  Future<void> saveConfig(String key, dynamic value) async {
    _ensureInitialized();

    if (value == null) {
      await _box!.delete(key);
      return;
    }

    // Store primitives directly, encode complex objects as JSON
    if (value is num || value is bool || value is String) {
      await _box!.put(key, value);
    } else {
      try {
        final json = jsonEncode(value);
        await _box!.put(key, json);
      } catch (e) {
        if (kDebugMode) {
          print('HiveLocalSource: Failed to encode $key, storing as string: $e');
        }
        await _box!.put(key, value.toString());
      }
    }
  }

  @override
  Future<void> deleteConfig(String key) async {
    _ensureInitialized();
    await _box!.delete(key);
  }

  /// Clear all configs (use with caution)
  Future<void> clearAll() async {
    _ensureInitialized();
    await _box!.clear();
  }

  /// Close the Hive box
  Future<void> close() async {
    if (_box != null && _box!.isOpen) {
      await _box!.close();
      _initialized = false;
    }
  }

  /// Get all stored keys
  Iterable<String> getAllKeys() {
    _ensureInitialized();
    return _box!.keys.cast<String>();
  }

  /// Check if a key exists
  bool containsKey(String key) {
    _ensureInitialized();
    return _box!.containsKey(key);
  }
}
