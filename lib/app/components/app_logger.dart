import 'package:flutter/foundation.dart';
import 'package:flutterx2/app/data/enums/env_enum.dart';
import 'package:flutterx2/app/data/env_config.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static AppLogger? _instance;

  static AppLogger get instance => _instance ??= AppLogger._internal();

  late Logger _logger;

  AppLogger._internal() {
    _logger = Logger(
      filter: debug() ? DevelopmentFilter() : ProductionFilter(),
    );
  }

  void i(String message, {String? tag}) {
    _logger.i(tag == null ? message : '$tag: $message');
  }

  void d(String message, {String? tag}) {
    _logger.d(tag == null ? message : '$tag: $message');
  }

  void e(String message, {String? tag}) {
    _logger.e(tag == null ? message : '$tag: $message');
  }

  void v(String message, {String? tag}) {
    _logger.t(tag == null ? message : '$tag: $message');
  }

  void w(String message, {String? tag}) {
    _logger.w(tag == null ? message : '$tag: $message');
  }

  bool debug() {
    // 检查当前环境是否为生产环境
    bool isProduction = EnvConfig.instance.env == EnvEnum.prod.toString() && !kDebugMode;

    // 如果是生产环境，则返回 false，否则返回 true
    return !isProduction;
  }
}
