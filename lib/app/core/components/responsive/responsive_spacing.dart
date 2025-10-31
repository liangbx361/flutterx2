import 'package:flutter/material.dart';
import 'package:flutterx2/app/core/components/responsive/responsive_extensions.dart';

/// 响应式间距常量
/// 提供一套标准的间距值，自动适配不同设备
class ResponsiveSpacing {
  // ===== 基础间距 =====

  /// 超小间距：4
  static double xs(BuildContext context) => 4.spacing(context);

  /// 小间距：8
  static double sm(BuildContext context) => 8.spacing(context);

  /// 中等间距：16
  static double md(BuildContext context) => 16.spacing(context);

  /// 大间距：24
  static double lg(BuildContext context) => 24.spacing(context);

  /// 超大间距：32
  static double xl(BuildContext context) => 32.spacing(context);

  /// 超超大间距：48
  static double xxl(BuildContext context) => 48.spacing(context);

  // ===== EdgeInsets 快捷方式 =====

  /// 全方向相同间距
  static EdgeInsets all(BuildContext context, double value) {
    final spacing = value.spacing(context);
    return EdgeInsets.all(spacing);
  }

  /// 水平间距
  static EdgeInsets horizontal(BuildContext context, double value) {
    final spacing = value.spacing(context);
    return EdgeInsets.symmetric(horizontal: spacing);
  }

  /// 垂直间距
  static EdgeInsets vertical(BuildContext context, double value) {
    final spacing = value.spacing(context);
    return EdgeInsets.symmetric(vertical: spacing);
  }

  /// 对称间距
  static EdgeInsets symmetric(
    BuildContext context, {
    double horizontal = 0,
    double vertical = 0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: horizontal.spacing(context),
      vertical: vertical.spacing(context),
    );
  }

  /// 自定义各边间距
  static EdgeInsets only(
    BuildContext context, {
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: left.spacing(context),
      top: top.spacing(context),
      right: right.spacing(context),
      bottom: bottom.spacing(context),
    );
  }

  // ===== 预定义常用间距 =====

  /// 页面边距（通常用于页面最外层容器）
  static EdgeInsets pagePadding(BuildContext context) {
    return context.responsiveValue(
      mobile: EdgeInsets.all(16.spacing(context)),
      tablet: EdgeInsets.all(24.spacing(context)),
      desktop: EdgeInsets.all(32.spacing(context)),
    );
  }

  /// 卡片内边距
  static EdgeInsets cardPadding(BuildContext context) {
    return context.responsiveValue(
      mobile: EdgeInsets.all(12.spacing(context)),
      tablet: EdgeInsets.all(16.spacing(context)),
      desktop: EdgeInsets.all(20.spacing(context)),
    );
  }

  /// 列表项内边距
  static EdgeInsets listItemPadding(BuildContext context) {
    return context.responsiveValue(
      mobile: symmetric(context, horizontal: 16, vertical: 12),
      tablet: symmetric(context, horizontal: 20, vertical: 14),
      desktop: symmetric(context, horizontal: 24, vertical: 16),
    );
  }

  /// 按钮内边距
  static EdgeInsets buttonPadding(BuildContext context) {
    return context.responsiveValue(
      mobile: symmetric(context, horizontal: 16, vertical: 12),
      tablet: symmetric(context, horizontal: 20, vertical: 14),
      desktop: symmetric(context, horizontal: 24, vertical: 16),
    );
  }

  /// 表单字段内边距
  static EdgeInsets inputPadding(BuildContext context) {
    return context.responsiveValue(
      mobile: symmetric(context, horizontal: 12, vertical: 10),
      tablet: symmetric(context, horizontal: 16, vertical: 12),
      desktop: symmetric(context, horizontal: 20, vertical: 14),
    );
  }

  // ===== 间隔组件 =====

  /// 垂直间隔
  static Widget verticalSpace(BuildContext context, double height) {
    return SizedBox(height: height.spacing(context));
  }

  /// 水平间隔
  static Widget horizontalSpace(BuildContext context, double width) {
    return SizedBox(width: width.spacing(context));
  }

  /// 预定义垂直间隔
  static Widget get vSpaceXS => Builder(
        builder: (context) => verticalSpace(context, 4),
      );

  static Widget get vSpaceSM => Builder(
        builder: (context) => verticalSpace(context, 8),
      );

  static Widget get vSpaceMD => Builder(
        builder: (context) => verticalSpace(context, 16),
      );

  static Widget get vSpaceLG => Builder(
        builder: (context) => verticalSpace(context, 24),
      );

  static Widget get vSpaceXL => Builder(
        builder: (context) => verticalSpace(context, 32),
      );

  /// 预定义水平间隔
  static Widget get hSpaceXS => Builder(
        builder: (context) => horizontalSpace(context, 4),
      );

  static Widget get hSpaceSM => Builder(
        builder: (context) => horizontalSpace(context, 8),
      );

  static Widget get hSpaceMD => Builder(
        builder: (context) => horizontalSpace(context, 16),
      );

  static Widget get hSpaceLG => Builder(
        builder: (context) => horizontalSpace(context, 24),
      );

  static Widget get hSpaceXL => Builder(
        builder: (context) => horizontalSpace(context, 32),
      );
}

/// 响应式圆角
class ResponsiveRadius {
  /// 小圆角：4
  static double sm(BuildContext context) => 4.radius(context);

  /// 中等圆角：8
  static double md(BuildContext context) => 8.radius(context);

  /// 大圆角：12
  static double lg(BuildContext context) => 12.radius(context);

  /// 超大圆角：16
  static double xl(BuildContext context) => 16.radius(context);

  /// 圆形（如头像）
  static double circular(BuildContext context, double size) => (size / 2).radius(context);

  /// BorderRadius 快捷方式
  static BorderRadius all(BuildContext context, double value) {
    return BorderRadius.circular(value.radius(context));
  }

  /// 仅顶部圆角
  static BorderRadius top(BuildContext context, double value) {
    final radius = value.radius(context);
    return BorderRadius.only(
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
    );
  }

  /// 仅底部圆角
  static BorderRadius bottom(BuildContext context, double value) {
    final radius = value.radius(context);
    return BorderRadius.only(
      bottomLeft: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    );
  }

  /// 预定义常用圆角
  static BorderRadius cardRadius(BuildContext context) {
    return all(context, 12);
  }

  static BorderRadius buttonRadius(BuildContext context) {
    return all(context, 8);
  }

  static BorderRadius inputRadius(BuildContext context) {
    return all(context, 8);
  }

  static BorderRadius dialogRadius(BuildContext context) {
    return all(context, 16);
  }
}

/// 响应式图标大小
class ResponsiveIconSize {
  /// 小图标：16
  static double sm(BuildContext context) => 16.iconSize(context);

  /// 中等图标：24
  static double md(BuildContext context) => 24.iconSize(context);

  /// 大图标：32
  static double lg(BuildContext context) => 32.iconSize(context);

  /// 超大图标：48
  static double xl(BuildContext context) => 48.iconSize(context);

  /// 按钮图标
  static double button(BuildContext context) => 20.iconSize(context);

  /// AppBar 图标
  static double appBar(BuildContext context) => 24.iconSize(context);

  /// 底部导航栏图标
  static double bottomNav(BuildContext context) => 24.iconSize(context);
}
