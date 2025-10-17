import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 测试帮助：创建一个独立的 ProviderContainer，并在测试结束时自动 dispose
/// 创建一个 ProviderContainer 并在测试结束自动 dispose
ProviderContainer createTestContainer() {
  final container = ProviderContainer();
  addTearDown(container.dispose);
  return container;
}

/// 便捷函数：从 container 读取 provider
T readFromContainer<T>(ProviderContainer container, dynamic provider) => container.read(provider);