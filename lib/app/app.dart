import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutterx2/app/app_providers.dart';
import 'package:flutterx2/app/router/app_router.dart';
import 'package:flutterx2/app/values/app_theme.dart';

/// 全局容器实例，用于测试和应用状态管理
final globalContainer = ProviderContainer();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return UncontrolledProviderScope(
      container: globalContainer,
      child: Consumer(
        builder: (context, ref, child) {
          final themeMode = ref.watch(appThemeModeProvider);
          final router = ref.watch(appRouterProvider);

          return MaterialApp.router(
            title: 'FlutterX2',
            routerConfig: router,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
            // 国际化配置
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        },
      ),
    );
  }
}
