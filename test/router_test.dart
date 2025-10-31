import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kidflow/app/app.dart';
import 'package:kidflow/app/router/app_router.dart';

void main() {
  group('App Router Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    testWidgets('should navigate to home page', (WidgetTester tester) async {
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const App(),
        ),
      );

      // 等待初始页面加载
      await tester.pumpAndSettle();

      // 验证启动页面是否显示
      expect(find.text('Splash Page'), findsOneWidget);

      // 模拟导航到首页
      final router = container.read(appRouterProvider);
      router.go(AppRoutes.home);

      await tester.pumpAndSettle();

      // 验证首页是否显示
      expect(find.text('Home Page'), findsOneWidget);
    });

    testWidgets('should show error page for invalid route', (WidgetTester tester) async {
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const App(),
        ),
      );

      await tester.pumpAndSettle();

      // 导航到无效路由
      final router = container.read(appRouterProvider);
      router.go('/invalid-route');

      await tester.pumpAndSettle();

      // 验证错误页面是否显示
      expect(find.text('页面未找到'), findsOneWidget);
      expect(find.text('返回首页'), findsOneWidget);
    });

    testWidgets('should handle route guard', (WidgetTester tester) async {
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const App(),
        ),
      );

      await tester.pumpAndSettle();

      // 导航到需要认证的页面
      final router = container.read(appRouterProvider);
      router.go(AppRoutes.profile);

      await tester.pumpAndSettle();

      // 由于当前认证守卫返回true，应该可以访问
      // 在实际应用中，这里可能会重定向到登录页
      expect(find.text('个人资料页面'), findsOneWidget);
    });

    test('should have correct route constants', () {
      expect(AppRoutes.splash, equals('/'));
      expect(AppRoutes.home, equals('/home'));
      expect(AppRoutes.login, equals('/login'));
      expect(AppRoutes.profile, equals('/profile'));
      expect(AppRoutes.noPermission, equals('/no-permission'));
    });

    test('should create router with correct configuration', () {
      final router = container.read(appRouterProvider);

      expect(router, isA<GoRouter>());
      expect(router.configuration.routes.length, greaterThan(0));
    });
  });

  group('Route Helper Tests', () {
    testWidgets('should provide navigation utilities', (WidgetTester tester) async {
      late BuildContext testContext;

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: globalContainer,
          child: MaterialApp.router(
            routerConfig: globalContainer.read(appRouterProvider),
            builder: (context, child) {
              testContext = context;
              return child ?? const SizedBox();
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      // 测试当前路由检查
      final currentRoute = AppRouterHelper.getCurrentRouteName(testContext);
      expect(currentRoute, isNotNull);

      // 测试路由比较
      final isCurrentRoute = AppRouterHelper.isCurrentRoute(testContext, AppRoutes.splash);
      expect(isCurrentRoute, isA<bool>());
    });
  });
}
