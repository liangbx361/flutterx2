import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 全局唯一的 ProviderContainer（只创建一次）
final ProviderContainer globalContainer = ProviderContainer();

/// 通用全局读取：任何没有 ref 的地方都可以用
T readGlobal<T>(dynamic provider) => globalContainer.read(provider);

/// 可选：全局监听（返回一个可以取消的侦听器）
dynamic listenGlobal<T>(dynamic provider, void Function(T? previous, T next) onChange) {
  return globalContainer.listen<T>(provider, (prev, next) => onChange(prev, next));
}

/// 可选的小工具风格 ServiceLocator（按需写，不强制）
class ServiceLocator {
  static T get<T>(dynamic provider) => globalContainer.read(provider);
}
