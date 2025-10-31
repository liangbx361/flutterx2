import 'package:flutter/material.dart';

/// 应用支持的语言配置
class AppLocalization {
  /// 支持的语言列表
  static const List<Locale> supportedLocales = [
    Locale('en'), // English
    Locale('zh', 'Hans'), // 简体中文
    Locale('es'), // Español
  ];

  /// 默认语言
  static const Locale fallbackLocale = Locale('en');

  /// 翻译文件路径
  static const String translationPath = 'assets/i18n';

  /// 获取语言显示名称
  static String getLanguageName(Locale locale) {
    final languageCode = locale.languageCode;
    final scriptCode = locale.scriptCode;

    if (languageCode == 'zh') {
      if (scriptCode == 'Hans') return '简体中文';
      if (scriptCode == 'Hant') return '繁體中文';
      return '中文';
    }

    switch (languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      default:
        return locale.toString();
    }
  }
}
