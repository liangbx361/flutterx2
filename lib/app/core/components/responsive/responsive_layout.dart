import 'package:flutter/widgets.dart';
import 'package:flutterx2/app/core/components/responsive/responsive_utils.dart';

/// 响应式布局构建器
/// 根据设备类型自动选择合适的布局
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);

    switch (deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
    }
  }
}

/// 响应式布局构建器（回调方式）
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceType deviceType) builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    return builder(context, deviceType);
  }
}

/// 响应式列数布局（用于 GridView 等）
class ResponsiveColumns {
  /// 获取响应式列数
  static int getColumns(
    BuildContext context, {
    int mobile = 1,
    int? tablet,
    int? desktop,
  }) {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    switch (deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? mobile * 2;
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile * 3;
    }
  }

  /// 获取响应式最大宽度（用于内容居中）
  static double getMaxWidth(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    switch (deviceType) {
      case DeviceType.mobile:
        return double.infinity;
      case DeviceType.tablet:
        return 768;
      case DeviceType.desktop:
        return 1200;
    }
  }

  /// 获取响应式交叉轴数量（用于 GridView.builder）
  static int getCrossAxisCount(BuildContext context) {
    final width = ResponsiveUtils.screenWidth(context);
    if (width < ResponsiveBreakpoints.mobile) {
      return 2; // 移动端 2 列
    } else if (width < ResponsiveBreakpoints.tablet) {
      return 3; // 平板 3 列
    } else if (width < ResponsiveBreakpoints.desktop) {
      return 4; // 小桌面 4 列
    } else {
      return 6; // 大桌面 6 列
    }
  }
}

/// 居中约束容器（桌面端内容不会过宽）
class ResponsiveCenterContainer extends StatelessWidget {
  final Widget child;
  final double? maxWidth;
  final EdgeInsetsGeometry? padding;

  const ResponsiveCenterContainer({
    super.key,
    required this.child,
    this.maxWidth,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final constrainedMaxWidth = maxWidth ?? ResponsiveColumns.getMaxWidth(context);

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: constrainedMaxWidth),
        padding: padding,
        child: child,
      ),
    );
  }
}

/// 响应式 Wrap 间距
class ResponsiveWrap extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  final WrapAlignment alignment;
  final WrapCrossAlignment crossAxisAlignment;

  const ResponsiveWrap({
    super.key,
    required this.children,
    this.spacing = 8,
    this.runSpacing = 8,
    this.alignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final scale = deviceType == DeviceType.mobile
        ? 1.0
        : deviceType == DeviceType.tablet
            ? 1.2
            : 1.4;

    return Wrap(
      spacing: spacing * scale,
      runSpacing: runSpacing * scale,
      alignment: alignment,
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    );
  }
}
