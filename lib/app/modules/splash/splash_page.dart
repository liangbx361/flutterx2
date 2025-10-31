import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterx2/app/components/app_page_scaffold.dart';
import 'package:flutterx2/app/modules/splash/splash_controller.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(splashControllerProvider);

    return AppPageScaffold(
      loadState: controller.state,
      loading: _buildBody(context, ref, controller),
      body: _buildBody(context, ref, controller),
    );
  }

  /// 构建闪屏页内容
  Widget _buildBody(BuildContext context, WidgetRef ref, dynamic controller) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // App Logo
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.child_care,
              size: 60,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 40),

          // App Name
          Text(
            'FlutterX2',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),

          const SizedBox(height: 8),

          // App Slogan
          Text(
            '陪伴孩子健康成长',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
          ),

          const SizedBox(height: 60),

          // Loading Indicator
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).primaryColor,
            ),
          ),

          const SizedBox(height: 20),

          // Loading Text
          Text(
            controller.currentTask ?? '正在启动...',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),

          // Error Retry Button (if needed)
          if (controller.hasError) ...[
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(splashControllerProvider.notifier).retry();
              },
              child: const Text('重试'),
            ),
          ],
        ],
      ),
    );
  }
}
