import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kidflow/app/core/components/loader/load_state.dart';
import 'package:kidflow/app/router/app_router.dart';

part 'splash_controller.g.dart';

/// 闪屏页控制器
@riverpod
class SplashController extends _$SplashController {
  Timer? _initTimer;

  @override
  LoadData<bool> build() {
    // 开始初始化
    _startInitialization();
    return LoadData.loading(currentTask: '正在初始化应用...');
  }

  /// 开始初始化流程
  void _startInitialization() {
    // 模拟1-3秒的初始化延迟
    final Random random = Random();
    final int delaySeconds = 1 + random.nextInt(3); // 1到3秒的随机延迟

    _initTimer = Timer(Duration(seconds: delaySeconds), () {
      _performInitialization();
    });
  }

  /// 执行初始化逻辑
  Future<void> _performInitialization() async {
    try {
      // 更新状态为正在初始化
      state = LoadData.loading(currentTask: '初始化系统配置...');

      // 模拟各种初始化任务
      await _initializeSystemConfig();
      await _initializeUserData();
      await _initializeAppServices();

      // 初始化完成
      state = LoadData.success(true);

      // 延迟一下再跳转，让用户看到初始化完成的状态
      await Future.delayed(const Duration(milliseconds: 500));

      // 这里可以添加页面跳转逻辑
      _navigateToMainApp();
    } catch (error) {
      // 初始化失败
      state = LoadData.error('初始化失败: ${error.toString()}');
    }
  }

  /// 初始化系统配置
  Future<void> _initializeSystemConfig() async {
    state = LoadData.loading(currentTask: '加载系统配置...');
    await Future.delayed(const Duration(milliseconds: 300));
  }

  /// 初始化用户数据
  Future<void> _initializeUserData() async {
    state = LoadData.loading(currentTask: '加载用户数据...');
    await Future.delayed(const Duration(milliseconds: 200));
  }

  /// 初始化应用服务
  Future<void> _initializeAppServices() async {
    state = LoadData.loading(currentTask: '启动应用服务...');
    await Future.delayed(const Duration(milliseconds: 400));
  }

  /// 导航到主应用
  void _navigateToMainApp() {
    try {
      // 通过 ref 获取路由并导航到主页
      final router = ref.read(appRouterProvider);
      router.go(AppRoutes.home);
      debugPrint('🚀 初始化完成，跳转到首页');
    } catch (e) {
      debugPrint('❌ 导航失败: $e');
    }
  }

  /// 重新初始化
  void retry() {
    state = LoadData.loading(currentTask: '正在重新初始化...');
    _startInitialization();
  }

  /// 清理资源
  void dispose() {
    _initTimer?.cancel();
    _initTimer = null;
  }

  /// 获取当前初始化状态
  bool get isInitializing => state.isLoading;

  /// 获取初始化是否完成
  bool get isInitialized => state.isSuccess;

  /// 获取是否有错误
  bool get hasError => state.hasError;

  /// 获取当前任务描述
  String? get currentTask => state.currentTask;

  /// 获取错误信息
  String? get errorMessage => state.errorMessage;
}
