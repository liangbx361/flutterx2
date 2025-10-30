// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 闪屏页控制器

@ProviderFor(SplashController)
const splashControllerProvider = SplashControllerProvider._();

/// 闪屏页控制器
final class SplashControllerProvider
    extends $NotifierProvider<SplashController, LoadData<bool>> {
  /// 闪屏页控制器
  const SplashControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'splashControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$splashControllerHash();

  @$internal
  @override
  SplashController create() => SplashController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoadData<bool> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoadData<bool>>(value),
    );
  }
}

String _$splashControllerHash() => r'ae7debb3259919130d4804d2a2b65908c7adfbcf';

/// 闪屏页控制器

abstract class _$SplashController extends $Notifier<LoadData<bool>> {
  LoadData<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LoadData<bool>, LoadData<bool>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<LoadData<bool>, LoadData<bool>>,
        LoadData<bool>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
