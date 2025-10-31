import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 路由守卫抽象类
abstract class RouteGuard {
  /// 检查是否可以访问该路由
  Future<bool> canActivate(BuildContext context, GoRouterState state);

  /// 当守卫拒绝访问时的重定向路径
  String get redirectPath;
}

/// 认证守卫
class AuthGuard implements RouteGuard {
  @override
  Future<bool> canActivate(BuildContext context, GoRouterState state) async {
    // TODO: 实现认证逻辑
    // 这里可以检查用户登录状态
    return true; // 暂时返回true
  }

  @override
  String get redirectPath => '/login';
}

/// 权限守卫
class PermissionGuard implements RouteGuard {
  final String requiredPermission;

  const PermissionGuard(this.requiredPermission);

  @override
  Future<bool> canActivate(BuildContext context, GoRouterState state) async {
    // TODO: 实现权限检查逻辑
    return true; // 暂时返回true
  }

  @override
  String get redirectPath => '/no-permission';
}

/// 路由守卫管理器
class RouteGuardManager {
  static final Map<String, List<RouteGuard>> _guards = {
    '/home': [AuthGuard()],
    '/profile': [
      AuthGuard(),
      const PermissionGuard('user:profile'),
    ],
    // 添加更多路由守卫配置
  };

  /// 检查路由是否可以访问
  static Future<String?> checkGuards(BuildContext context, GoRouterState state) async {
    final guards = _guards[state.matchedLocation];
    if (guards == null || guards.isEmpty) {
      return null; // 无守卫，允许访问
    }

    for (final guard in guards) {
      final canActivate = await guard.canActivate(context, state);
      if (!canActivate) {
        return guard.redirectPath;
      }
    }

    return null; // 所有守卫都通过
  }

  /// 添加路由守卫
  static void addGuard(String route, RouteGuard guard) {
    _guards[route] ??= [];
    _guards[route]!.add(guard);
  }

  /// 移除路由守卫
  static void removeGuard(String route, RouteGuard guard) {
    _guards[route]?.remove(guard);
  }
}
