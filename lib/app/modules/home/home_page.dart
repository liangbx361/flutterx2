import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutterx2/app/app_providers.dart';
import 'package:flutterx2/app/values/app_theme.dart';
import 'package:flutterx2/app/values/locale_keys.g.dart';

/// 首页 - 演示 Riverpod 使用
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appConfig = ref.watch(appConfigProvider);
    final counter = ref.watch(counterProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.app_title.tr()),
        actions: [
          IconButton(
            icon: Icon(theme.isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => ref.read(appThemeModeProvider.notifier).toggle(),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: theme.backgroundGradient),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // 欢迎卡片
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.waving_hand,
                        size: 48,
                        color: Colors.orange,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        LocaleKeys.home_welcome_to_app.tr(namedArgs: {'appName': appConfig['appName'] ?? 'FlutterX2'}),
                        style: theme.textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        LocaleKeys.home_version.tr(namedArgs: {'version': appConfig['version'] ?? '1.0.0'}),
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // 计数器演示卡片
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        LocaleKeys.home_counter_demo.tr(),
                        style: theme.textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: theme.colorScheme.primary,
                            width: 3,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '$counter',
                            style: theme.textTheme.headlineLarge?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _CounterButton(
                            icon: Icons.remove,
                            onPressed: () => ref.read(counterProvider.notifier).decrement(),
                            backgroundColor: AppTheme.errorColor,
                            tooltip: LocaleKeys.home_decrement.tr(),
                          ),
                          _CounterButton(
                            icon: Icons.refresh,
                            onPressed: () => ref.read(counterProvider.notifier).reset(),
                            backgroundColor: AppTheme.warningColor,
                            tooltip: LocaleKeys.home_reset.tr(),
                          ),
                          _CounterButton(
                            icon: Icons.add,
                            onPressed: () => ref.read(counterProvider.notifier).increment(),
                            backgroundColor: AppTheme.successColor,
                            tooltip: LocaleKeys.home_increment.tr(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // 功能区域（为未来扩展预留）
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        LocaleKeys.home_coming_soon.tr(),
                        style: theme.textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        LocaleKeys.home_more_features.tr(),
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 计数器按钮组件
class _CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final String tooltip;

  const _CounterButton({
    required this.icon,
    required this.onPressed,
    required this.backgroundColor,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        elevation: 4,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
