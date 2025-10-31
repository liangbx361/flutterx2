import 'package:flutter/widgets.dart';
import 'package:flutterx2/app/core/components/responsive/responsive_utils.dart';

/// BuildContext 扩展：添加响应式快捷方法
extension ResponsiveContext on BuildContext {
  /// 设备类型
  DeviceType get deviceType => ResponsiveUtils.getDeviceType(this);

  /// 是否为移动端
  bool get isMobile => ResponsiveUtils.isMobile(this);

  /// 是否为平板
  bool get isTablet => ResponsiveUtils.isTablet(this);

  /// 是否为桌面端
  bool get isDesktop => ResponsiveUtils.isDesktop(this);

  /// 屏幕宽度
  double get screenWidth => ResponsiveUtils.screenWidth(this);

  /// 屏幕高度
  double get screenHeight => ResponsiveUtils.screenHeight(this);

  /// 根据设备类型返回不同的值
  T responsiveValue<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    return ResponsiveUtils.value(
      this,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }

  /// 获取缩放比例
  double get scaleFactor => ResponsiveUtils.getScaleFactor(this);
}

/// 数字扩展：响应式尺寸
extension ResponsiveNum on num {
  /// 响应式宽度（根据屏幕宽度比例缩放）
  /// 使用场景：容器宽度、图片宽度等
  double w(BuildContext context) {
    final width = ResponsiveUtils.screenWidth(context);
    final deviceType = ResponsiveUtils.getDeviceType(context);

    switch (deviceType) {
      case DeviceType.mobile:
        // 移动端：以 375 为基准
        return this * width / 375.0;
      case DeviceType.tablet:
        // 平板：以 768 为基准
        return this * width / 768.0;
      case DeviceType.desktop:
        // 桌面端：以 1440 为基准，限制最大缩放
        return this * (width / 1440.0).clamp(1.0, 1.5);
    }
  }

  /// 响应式高度（根据屏幕高度比例缩放）
  /// 使用场景：容器高度等
  double h(BuildContext context) {
    final height = ResponsiveUtils.screenHeight(context);
    final deviceType = ResponsiveUtils.getDeviceType(context);

    switch (deviceType) {
      case DeviceType.mobile:
        // 移动端：以 812 为基准（iPhone X 系列高度）
        return this * height / 812.0;
      case DeviceType.tablet:
        // 平板：以 1024 为基准（iPad 高度）
        return this * height / 1024.0;
      case DeviceType.desktop:
        // 桌面端：以 900 为基准，限制最大缩放
        return this * (height / 900.0).clamp(1.0, 1.5);
    }
  }

  /// 响应式字体大小（根据设备类型和屏幕尺寸）
  /// 使用场景：Text 字体大小
  ///
  /// 策略：
  /// - 移动端：按比例缩放，但限制最小最大值
  /// - 平板：在移动端基础上放大 1.2-1.3 倍
  /// - 桌面端：在移动端基础上放大 1.3-1.5 倍
  double sp(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final scaleFactor = ResponsiveUtils.getScaleFactor(context);

    double fontSize;
    switch (deviceType) {
      case DeviceType.mobile:
        // 移动端：轻微缩放，限制范围避免过大或过小
        fontSize = this * scaleFactor.clamp(0.85, 1.15);
        break;
      case DeviceType.tablet:
        // 平板：在移动端基础上放大 20-30%
        fontSize = this * 1.2 * scaleFactor.clamp(0.9, 1.2);
        break;
      case DeviceType.desktop:
        // 桌面端：在移动端基础上放大 30-50%，但有上限
        fontSize = this * 1.3 * scaleFactor.clamp(1.0, 1.3);
        break;
    }

    // 确保字体大小在合理范围内（最小 10，最大 100）
    return fontSize.clamp(10.0, 100.0);
  }

  /// 响应式间距（用于 padding、margin、gap 等）
  /// 使用场景：EdgeInsets、SizedBox、Gap 等
  ///
  /// 策略：
  /// - 小间距（<= 8）：各平台差异小
  /// - 中间距（8-24）：平板和桌面端适当增加
  /// - 大间距（> 24）：桌面端显著增加
  double spacing(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final baseValue = toDouble();

    switch (deviceType) {
      case DeviceType.mobile:
        return baseValue;
      case DeviceType.tablet:
        // 平板端：小间距不变，中大间距增加 20-40%
        if (baseValue <= 8) {
          return baseValue;
        } else if (baseValue <= 24) {
          return baseValue * 1.2;
        } else {
          return baseValue * 1.4;
        }
      case DeviceType.desktop:
        // 桌面端：小间距不变，中大间距增加 40-60%
        if (baseValue <= 8) {
          return baseValue;
        } else if (baseValue <= 24) {
          return baseValue * 1.4;
        } else {
          return baseValue * 1.6;
        }
    }
  }

  /// 响应式圆角（用于 BorderRadius）
  /// 使用场景：Container、Card 等的圆角
  double radius(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final baseValue = toDouble();

    switch (deviceType) {
      case DeviceType.mobile:
        return baseValue;
      case DeviceType.tablet:
        // 平板端：圆角略微增大
        return baseValue * 1.15;
      case DeviceType.desktop:
        // 桌面端：圆角增大 20-30%
        return baseValue * 1.25;
    }
  }

  /// 响应式图标大小
  /// 使用场景：Icon size
  double iconSize(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final baseValue = toDouble();

    switch (deviceType) {
      case DeviceType.mobile:
        return baseValue;
      case DeviceType.tablet:
        // 平板端：图标增大 25%
        return baseValue * 1.25;
      case DeviceType.desktop:
        // 桌面端：图标增大 40%
        return baseValue * 1.4;
    }
  }
}

/// EdgeInsets 扩展：响应式边距
extension ResponsiveEdgeInsets on EdgeInsets {
  /// 将 EdgeInsets 转换为响应式边距
  EdgeInsets responsive(BuildContext context) {
    return EdgeInsets.only(
      left: left.spacing(context),
      top: top.spacing(context),
      right: right.spacing(context),
      bottom: bottom.spacing(context),
    );
  }
}

/// BorderRadius 扩展：响应式圆角
extension ResponsiveBorderRadius on BorderRadius {
  /// 将 BorderRadius 转换为响应式圆角
  BorderRadius responsive(BuildContext context) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft.x.radius(context)),
      topRight: Radius.circular(topRight.x.radius(context)),
      bottomLeft: Radius.circular(bottomLeft.x.radius(context)),
      bottomRight: Radius.circular(bottomRight.x.radius(context)),
    );
  }
}
