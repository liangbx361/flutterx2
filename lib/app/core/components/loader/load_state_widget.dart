import 'package:flutter/material.dart';
import 'load_state.dart';

/// 加载状态 Widget 抽象基类
///
/// 使用 Template Method 模式，提供统一的状态管理框架。
/// 子类只需实现具体的 UI 构建方法。
abstract class BaseLoadStateWidget extends StatelessWidget {
  final LoadStateEnum loadState;
  final Widget content;

  const BaseLoadStateWidget({
    super.key,
    required this.loadState,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return buildByState(context);
  }

  /// 模板方法：根据状态构建 Widget
  Widget buildByState(BuildContext context) {
    switch (loadState) {
      case LoadStateEnum.loading:
        return buildLoadingState(context);
      case LoadStateEnum.success:
        return buildSuccessState(context);
      case LoadStateEnum.noData:
        return buildNoDataState(context);
      case LoadStateEnum.error:
        return buildErrorState(context);
      case LoadStateEnum.networkError:
        return buildNetworkErrorState(context);
      case LoadStateEnum.unlogin:
        return buildUnloginState(context);
    }
  }

  /// 加载中状态 UI
  Widget buildLoadingState(BuildContext context);

  /// 成功状态 UI
  Widget buildSuccessState(BuildContext context);

  /// 无数据状态 UI
  Widget buildNoDataState(BuildContext context);

  /// 错误状态 UI
  Widget buildErrorState(BuildContext context);

  /// 网络错误状态 UI
  Widget buildNetworkErrorState(BuildContext context);

  /// 未登录状态 UI
  Widget buildUnloginState(BuildContext context);
}
