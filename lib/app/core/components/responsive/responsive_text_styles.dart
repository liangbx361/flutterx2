import 'package:flutter/material.dart';
import 'package:flutterx2/app/core/components/responsive/responsive_extensions.dart';

/// 响应式文本样式
/// 提供一套预定义的文本样式，自动适配不同设备
class ResponsiveTextStyles {
  /// 超大标题（如页面主标题）
  static TextStyle displayLarge(BuildContext context) {
    return TextStyle(
      fontSize: 32.sp(context),
      fontWeight: FontWeight.bold,
      height: 1.2,
    );
  }

  /// 大标题
  static TextStyle displayMedium(BuildContext context) {
    return TextStyle(
      fontSize: 28.sp(context),
      fontWeight: FontWeight.bold,
      height: 1.2,
    );
  }

  /// 中标题
  static TextStyle displaySmall(BuildContext context) {
    return TextStyle(
      fontSize: 24.sp(context),
      fontWeight: FontWeight.bold,
      height: 1.3,
    );
  }

  /// 大号标题（如 Card 标题）
  static TextStyle headlineLarge(BuildContext context) {
    return TextStyle(
      fontSize: 20.sp(context),
      fontWeight: FontWeight.w600,
      height: 1.3,
    );
  }

  /// 中号标题
  static TextStyle headlineMedium(BuildContext context) {
    return TextStyle(
      fontSize: 18.sp(context),
      fontWeight: FontWeight.w600,
      height: 1.3,
    );
  }

  /// 小号标题
  static TextStyle headlineSmall(BuildContext context) {
    return TextStyle(
      fontSize: 16.sp(context),
      fontWeight: FontWeight.w600,
      height: 1.4,
    );
  }

  /// 大号正文
  static TextStyle bodyLarge(BuildContext context) {
    return TextStyle(
      fontSize: 16.sp(context),
      fontWeight: FontWeight.normal,
      height: 1.5,
    );
  }

  /// 中号正文（常规文本）
  static TextStyle bodyMedium(BuildContext context) {
    return TextStyle(
      fontSize: 14.sp(context),
      fontWeight: FontWeight.normal,
      height: 1.5,
    );
  }

  /// 小号正文
  static TextStyle bodySmall(BuildContext context) {
    return TextStyle(
      fontSize: 12.sp(context),
      fontWeight: FontWeight.normal,
      height: 1.5,
    );
  }

  /// 大号标签
  static TextStyle labelLarge(BuildContext context) {
    return TextStyle(
      fontSize: 14.sp(context),
      fontWeight: FontWeight.w500,
      height: 1.4,
    );
  }

  /// 中号标签
  static TextStyle labelMedium(BuildContext context) {
    return TextStyle(
      fontSize: 12.sp(context),
      fontWeight: FontWeight.w500,
      height: 1.4,
    );
  }

  /// 小号标签（如辅助文本、提示文本）
  static TextStyle labelSmall(BuildContext context) {
    return TextStyle(
      fontSize: 10.sp(context),
      fontWeight: FontWeight.w500,
      height: 1.4,
    );
  }

  /// 按钮文本
  static TextStyle button(BuildContext context) {
    return TextStyle(
      fontSize: 14.sp(context),
      fontWeight: FontWeight.w600,
      height: 1.2,
      letterSpacing: 0.5,
    );
  }

  /// 大号按钮文本
  static TextStyle buttonLarge(BuildContext context) {
    return TextStyle(
      fontSize: 16.sp(context),
      fontWeight: FontWeight.w600,
      height: 1.2,
      letterSpacing: 0.5,
    );
  }
}

/// TextStyle 扩展：添加响应式方法
extension ResponsiveTextStyle on TextStyle {
  /// 使 TextStyle 响应式（字体大小自动适配）
  TextStyle responsive(BuildContext context) {
    final currentSize = fontSize ?? 14.0;
    return copyWith(
      fontSize: currentSize.sp(context),
    );
  }

  /// 根据设备类型返回不同的样式
  TextStyle responsiveValue(
    BuildContext context, {
    TextStyle? mobile,
    TextStyle? tablet,
    TextStyle? desktop,
  }) {
    return context.responsiveValue(
      mobile: mobile ?? this,
      tablet: tablet,
      desktop: desktop,
    );
  }
}
