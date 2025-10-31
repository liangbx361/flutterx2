import 'package:flutter/material.dart';
import 'package:kidflow/app/values/app_theme.dart';

/// 主题工具类
class ThemeUtils {
  ThemeUtils._();

  /// 根据主题获取适应性颜色
  static Color adaptiveColor(
    BuildContext context, {
    required Color lightColor,
    required Color darkColor,
  }) {
    return Theme.of(context).brightness == Brightness.dark ? darkColor : lightColor;
  }

  /// 获取适应性文本颜色
  static Color adaptiveTextColor(
    BuildContext context, {
    Color? lightColor,
    Color? darkColor,
  }) {
    final theme = Theme.of(context);
    if (theme.brightness == Brightness.dark) {
      return darkColor ?? AppTheme.darkOnSurface;
    } else {
      return lightColor ?? AppTheme.lightOnSurface;
    }
  }

  /// 获取适应性背景颜色
  static Color adaptiveBackgroundColor(
    BuildContext context, {
    Color? lightColor,
    Color? darkColor,
  }) {
    final theme = Theme.of(context);
    if (theme.brightness == Brightness.dark) {
      return darkColor ?? AppTheme.darkBackground;
    } else {
      return lightColor ?? AppTheme.lightBackground;
    }
  }

  /// 获取适应性Surface颜色
  static Color adaptiveSurfaceColor(
    BuildContext context, {
    Color? lightColor,
    Color? darkColor,
  }) {
    final theme = Theme.of(context);
    if (theme.brightness == Brightness.dark) {
      return darkColor ?? AppTheme.darkSurface;
    } else {
      return lightColor ?? AppTheme.lightSurface;
    }
  }

  /// 获取状态颜色（成功、警告、错误等）
  static Color getStatusColor(String status) {
    return switch (status.toLowerCase()) {
      'success' => AppTheme.successColor,
      'warning' => AppTheme.warningColor,
      'error' => AppTheme.errorColor,
      'info' => AppTheme.infoColor,
      _ => AppTheme.primaryColor,
    };
  }

  /// 获取阴影颜色
  static Color getShadowColor(BuildContext context, {double opacity = 0.1}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.black.withOpacity(opacity * 2) : Colors.grey.withOpacity(opacity);
  }

  /// 获取分割线颜色
  static Color getDividerColor(BuildContext context) {
    return Theme.of(context).dividerColor;
  }

  /// 创建适应性装饰器
  static BoxDecoration createAdaptiveDecoration(
    BuildContext context, {
    BorderRadius? borderRadius,
    Color? lightColor,
    Color? darkColor,
    List<BoxShadow>? shadows,
    Border? border,
  }) {
    return BoxDecoration(
      color: adaptiveSurfaceColor(context, lightColor: lightColor, darkColor: darkColor),
      borderRadius: borderRadius,
      boxShadow: shadows,
      border: border,
    );
  }

  /// 创建渐变装饰器
  static BoxDecoration createGradientDecoration(
    BuildContext context, {
    BorderRadius? borderRadius,
    Gradient? gradient,
  }) {
    return BoxDecoration(
      gradient: gradient ?? Theme.of(context).backgroundGradient,
      borderRadius: borderRadius,
    );
  }
}

/// 常用组合小部件
class ThemedWidgets {
  ThemedWidgets._();

  /// 主题化卡片
  static Widget adaptiveCard({
    required BuildContext context,
    required Widget child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
    Color? color,
    List<BoxShadow>? shadows,
  }) {
    final theme = Theme.of(context);

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? theme.cardColor,
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        boxShadow: shadows ??
            [
              BoxShadow(
                color: ThemeUtils.getShadowColor(context),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16),
        child: child,
      ),
    );
  }

  /// 主题化按钮
  static Widget adaptiveButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? textColor,
    EdgeInsetsGeometry? padding,
    BorderRadius? borderRadius,
    double? elevation,
  }) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? theme.colorScheme.primary,
        foregroundColor: textColor ?? theme.colorScheme.onPrimary,
        elevation: elevation ?? 4,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
        ),
      ),
      child: Text(text),
    );
  }

  /// 主题化文本输入框
  static Widget adaptiveTextField({
    required BuildContext context,
    String? hintText,
    String? labelText,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    bool obscureText = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }

  /// 状态指示器
  static Widget statusIndicator({
    required BuildContext context,
    required String status,
    required String text,
    IconData? icon,
  }) {
    final statusColor = ThemeUtils.getStatusColor(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: statusColor.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: statusColor, size: 16),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
