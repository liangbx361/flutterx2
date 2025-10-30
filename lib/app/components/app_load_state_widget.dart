import 'package:flutter/material.dart';
import 'package:kidflow/app/core/components/loader/load_state_widget.dart';

class AppLoadStateWidget extends BaseLoadStateWidget {
  final Widget? loading;
  final Widget? noData;
  final Widget? error;
  final Widget? networkError;
  final Widget? unlogin;
  final Function? onRetry;

  const AppLoadStateWidget({
    super.key,
    required super.loadState,
    required super.content,
    this.loading,
    this.noData,
    this.error,
    this.networkError,
    this.unlogin,
    this.onRetry,
  });

  @override
  Widget buildLoadingState(BuildContext context) {
    return loading ?? _buildDefaultLoadingState();
  }

  @override
  Widget buildErrorState(BuildContext context) {
    return error ?? _buildDefaultErrorState(context);
  }

  @override
  Widget buildNetworkErrorState(BuildContext context) {
    return networkError ?? _buildDefaultNetworkErrorState(context);
  }

  @override
  Widget buildNoDataState(BuildContext context) {
    return noData ?? _buildDefaultNoDataState(context);
  }

  @override
  Widget buildSuccessState(BuildContext context) {
    return content;
  }

  @override
  Widget buildUnloginState(BuildContext context) {
    return unlogin ?? _buildDefaultUnloginState(context);
  }

  /// 默认加载中状态 UI
  Widget _buildDefaultLoadingState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  /// 默认错误状态 UI
  Widget _buildDefaultErrorState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          Text(
            '加载失败',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              onRetry?.call();
            },
            child: const Text('重试'),
          ),
        ],
      ),
    );
  }

  /// 默认网络错误状态 UI
  Widget _buildDefaultNetworkErrorState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            '网络连接失败',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              onRetry?.call();
            },
            child: const Text('重试'),
          ),
        ],
      ),
    );
  }

  /// 默认无数据状态 UI
  Widget _buildDefaultNoDataState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.inbox,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            '暂无数据',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  /// 默认未登录状态 UI
  Widget _buildDefaultUnloginState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.account_circle,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            '请先登录',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              onRetry?.call();
            },
            child: const Text('立即登录'),
          ),
        ],
      ),
    );
  }
}
