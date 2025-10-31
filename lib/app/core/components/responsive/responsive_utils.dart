import 'package:flutter/widgets.dart';

/// 设备类型枚举
enum DeviceType {
  mobile,
  tablet,
  desktop,
}

/// 响应式断点配置
class ResponsiveBreakpoints {
  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;
}

/// 响应式工具类
class ResponsiveUtils {
  /// 获取设备类型
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < ResponsiveBreakpoints.mobile) {
      return DeviceType.mobile;
    } else if (width < ResponsiveBreakpoints.tablet) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  /// 判断是否为移动端
  static bool isMobile(BuildContext context) =>
      getDeviceType(context) == DeviceType.mobile;

  /// 判断是否为平板
  static bool isTablet(BuildContext context) =>
      getDeviceType(context) == DeviceType.tablet;

  /// 判断是否为桌面端
  static bool isDesktop(BuildContext context) =>
      getDeviceType(context) == DeviceType.desktop;

  /// 获取屏幕宽度
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  /// 获取屏幕高度
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  /// 根据设备类型返回不同的值
  static T value<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    final deviceType = getDeviceType(context);
    switch (deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
    }
  }

  /// 计算缩放比例（相对于基准宽度）
  static double getScaleFactor(BuildContext context) {
    final width = screenWidth(context);
    final deviceType = getDeviceType(context);

    switch (deviceType) {
      case DeviceType.mobile:
        // 以 375 为基准（iPhone SE/8 尺寸）
        return width / 375.0;
      case DeviceType.tablet:
        // 以 768 为基准（iPad 尺寸）
        return width / 768.0;
      case DeviceType.desktop:
        // 桌面端不缩放或限制最大缩放比例
        return (width / 1440.0).clamp(1.0, 1.5);
    }
  }
}
