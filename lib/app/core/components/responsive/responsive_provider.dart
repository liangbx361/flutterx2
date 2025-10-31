import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutterx2/app/core/components/responsive/responsive_utils.dart';

part 'responsive_provider.g.dart';

/// 设备类型 Provider
/// 注意：由于需要 BuildContext，这个 provider 需要在 Widget 中使用
/// 使用方式：ref.watch(deviceTypeProvider(context))
@riverpod
DeviceType deviceType(Ref ref, BuildContext context) {
  return ResponsiveUtils.getDeviceType(context);
}

/// 屏幕宽度 Provider
@riverpod
double screenWidth(Ref ref, BuildContext context) {
  return ResponsiveUtils.screenWidth(context);
}

/// 屏幕高度 Provider
@riverpod
double screenHeight(Ref ref, BuildContext context) {
  return ResponsiveUtils.screenHeight(context);
}

/// 是否为移动端 Provider
@riverpod
bool isMobile(Ref ref, BuildContext context) {
  return ResponsiveUtils.isMobile(context);
}

/// 是否为平板 Provider
@riverpod
bool isTablet(Ref ref, BuildContext context) {
  return ResponsiveUtils.isTablet(context);
}

/// 是否为桌面端 Provider
@riverpod
bool isDesktop(Ref ref, BuildContext context) {
  return ResponsiveUtils.isDesktop(context);
}
