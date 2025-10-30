import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kidflow/app/values/app_theme.dart';

part 'app_providers.g.dart';

/// 应用配置提供者
@riverpod
class AppConfig extends _$AppConfig {
  @override
  Map<String, dynamic> build() {
    return {
      'appName': 'KidFlow',
      'version': '0.1.0',
      'environment': 'development',
    };
  }

  /// 更新应用配置
  void updateConfig(String key, dynamic value) {
    state = {...state, key: value};
  }
}

/// 示例计数器提供者
@riverpod
class Counter extends _$Counter {
  @override
  int build() => 0;

  /// 增加计数
  void increment() => state++;

  /// 减少计数
  void decrement() => state--;

  /// 重置计数
  void reset() => state = 0;
}

/// 主题模式提供者
@riverpod
class AppThemeMode extends _$AppThemeMode {
  @override
  ThemeMode build() => ThemeMode.system; // 默认跟随系统

  /// 切换主题模式
  void toggle() {
    state = switch (state) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.system => ThemeMode.dark,
    };
  }

  /// 设置为浅色模式
  void setLight() => state = ThemeMode.light;

  /// 设置为深色模式
  void setDark() => state = ThemeMode.dark;

  /// 设置为跟随系统
  void setSystem() => state = ThemeMode.system;
}

/// 当前主题数据提供者
@riverpod
ThemeData currentTheme(Ref ref) {
  final themeMode = ref.watch(appThemeModeProvider);

  return switch (themeMode) {
    ThemeMode.light => AppTheme.lightTheme,
    ThemeMode.dark => AppTheme.darkTheme,
    ThemeMode.system => AppTheme.lightTheme, // 这里可以根据系统判断
  };
}
