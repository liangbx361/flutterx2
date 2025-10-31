import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterx2/app/modules/home/home_page.dart';
import 'package:flutterx2/app/modules/splash/splash_page.dart';
import 'package:flutterx2/app/modules/settings/language_settings_page.dart';
import 'package:flutterx2/app/router/route_guard.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

/// 应用路由名称常量
class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String languageSettings = '/settings/language';

  // 防止实例化
  AppRoutes._();
}

/// 路由转场动画配置
class RouteTransitions {
  /// 转场动画时长
  static const Duration transitionDuration = Duration(milliseconds: 500);

  /// Cupertino 风格转场动画
  static Page<T> cupertinoPage<T>({
    required Widget child,
    required GoRouterState state,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionDuration: transitionDuration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return CupertinoPageTransition(
          primaryRouteAnimation: animation,
          secondaryRouteAnimation: secondaryAnimation,
          linearTransition: false,
          child: child,
        );
      },
    );
  }
}

/// 路由配置 Provider - 保持全局生命周期
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      // 启动页（无动画，直接显示）
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),

      // 首页
      GoRoute(
        path: AppRoutes.home,
        pageBuilder: (context, state) => RouteTransitions.cupertinoPage(
          child: const HomePage(),
          state: state,
        ),
      ),

      // 语言设置页
      GoRoute(
        path: AppRoutes.languageSettings,
        pageBuilder: (context, state) => RouteTransitions.cupertinoPage(
          child: const LanguageSettingsPage(),
          state: state,
        ),
      ),
    ],

    // 路由重定向
    redirect: (context, state) async {
      // 检查路由守卫
      final redirectPath = await RouteGuardManager.checkGuards(context, state);
      return redirectPath;
    },

    // 错误页面配置
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(
        title: const Text('页面未找到'),
      ),
      body: Center(
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
              '页面未找到: ${state.matchedLocation}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.splash),
              child: const Text('返回首页'),
            ),
          ],
        ),
      ),
    ),

    // 调试模式下显示路由日志
    debugLogDiagnostics: true,
  );
}

/// 路由扩展方法
extension AppRouterExtension on GoRouter {
  /// 导航到启动页
  void goToSplash() => go(AppRoutes.splash);

  /// 导航到首页
  void goToHome() => go(AppRoutes.home);
}

/// 路由工具类
class AppRouterHelper {
  /// 获取当前路由名称
  static String? getCurrentRouteName(BuildContext context) {
    final routerDelegate = GoRouter.of(context).routerDelegate;
    return routerDelegate.currentConfiguration.matches.last.matchedLocation;
  }

  /// 检查是否是当前路由
  static bool isCurrentRoute(BuildContext context, String routePath) {
    return getCurrentRouteName(context) == routePath;
  }

  /// 安全导航（带错误处理）
  static void safePush(BuildContext context, String path) {
    try {
      context.push(path);
    } catch (e) {
      debugPrint('Navigation error: $e');
      // 可以在这里添加错误处理逻辑
    }
  }

  /// 安全替换（带错误处理）
  static void safeGo(BuildContext context, String path) {
    try {
      context.go(path);
    } catch (e) {
      debugPrint('Navigation error: $e');
      // 可以在这里添加错误处理逻辑
    }
  }
}
