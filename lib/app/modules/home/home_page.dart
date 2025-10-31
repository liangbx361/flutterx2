import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:flutterx2/app/app_providers.dart';
import 'package:flutterx2/app/values/app_theme.dart';
import 'package:flutterx2/app/values/locale_keys.g.dart';
import 'package:flutterx2/app/core/components/responsive/responsive.dart';

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
            icon: const Icon(Icons.language),
            tooltip: LocaleKeys.common_language.tr(),
            onPressed: () => context.push('/settings/language'),
          ),
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
        child: ResponsiveCenterContainer(
          maxWidth: context.responsiveValue(
            mobile: double.infinity,
            tablet: 768,
            desktop: 1200,
          ),
          child: SingleChildScrollView(
            padding: ResponsiveSpacing.pagePadding(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ResponsiveSpacing.verticalSpace(context, 40),
                // 欢迎卡片
                Card(
                  child: Padding(
                    padding: ResponsiveSpacing.cardPadding(context),
                    child: Column(
                      children: [
                        Icon(
                          Icons.waving_hand,
                          size: 48.iconSize(context),
                          color: Colors.orange,
                        ),
                        ResponsiveSpacing.vSpaceMD,
                        Text(
                          LocaleKeys.home_welcome_to_app
                              .tr(namedArgs: {'appName': appConfig['appName'] ?? 'FlutterX2'}),
                          style: ResponsiveTextStyles.headlineLarge(context).copyWith(
                            color: theme.textTheme.headlineMedium?.color,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        ResponsiveSpacing.vSpaceXS,
                        Text(
                          LocaleKeys.home_version.tr(namedArgs: {'version': appConfig['version'] ?? '1.0.0'}),
                          style: ResponsiveTextStyles.bodyMedium(context),
                        ),
                      ],
                    ),
                  ),
                ),
                ResponsiveSpacing.verticalSpace(context, 32),
                // 计数器演示卡片
                Card(
                  child: Padding(
                    padding: ResponsiveSpacing.cardPadding(context),
                    child: Column(
                      children: [
                        Text(
                          LocaleKeys.home_counter_demo.tr(),
                          style: ResponsiveTextStyles.headlineMedium(context),
                        ),
                        ResponsiveSpacing.vSpaceMD,
                        Container(
                          width: context.responsiveValue(
                            mobile: 100.0,
                            tablet: 120.0,
                            desktop: 140.0,
                          ),
                          height: context.responsiveValue(
                            mobile: 100.0,
                            tablet: 120.0,
                            desktop: 140.0,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: theme.colorScheme.primary,
                              width: 3.spacing(context),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '$counter',
                              style: ResponsiveTextStyles.displayLarge(context).copyWith(
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ),
                        ),
                        ResponsiveSpacing.vSpaceLG,
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
                ResponsiveSpacing.verticalSpace(context, 32),
                // 功能区域（为未来扩展预留）
                Card(
                  child: Padding(
                    padding: ResponsiveSpacing.cardPadding(context),
                    child: Column(
                      children: [
                        Text(
                          LocaleKeys.home_coming_soon.tr(),
                          style: ResponsiveTextStyles.headlineMedium(context),
                        ),
                        ResponsiveSpacing.vSpaceMD,
                        Text(
                          LocaleKeys.home_more_features.tr(),
                          style: ResponsiveTextStyles.bodyMedium(context),
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
    final buttonSize = context.responsiveValue(
      mobile: 56.0,
      tablet: 64.0,
      desktop: 72.0,
    );
    final iconSize = ResponsiveIconSize.md(context);
    final borderRadius = ResponsiveRadius.buttonRadius(context);

    return Tooltip(
      message: tooltip,
      child: Material(
        color: backgroundColor,
        borderRadius: borderRadius,
        elevation: 4,
        child: InkWell(
          onTap: onPressed,
          borderRadius: borderRadius,
          child: Container(
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
