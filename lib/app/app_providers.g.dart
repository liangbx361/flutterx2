// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 应用配置提供者

@ProviderFor(AppConfig)
const appConfigProvider = AppConfigProvider._();

/// 应用配置提供者
final class AppConfigProvider
    extends $NotifierProvider<AppConfig, Map<String, dynamic>> {
  /// 应用配置提供者
  const AppConfigProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'appConfigProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$appConfigHash();

  @$internal
  @override
  AppConfig create() => AppConfig();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, dynamic> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, dynamic>>(value),
    );
  }
}

String _$appConfigHash() => r'f104055ded537cdc4ed4b9c65d094e3192db3027';

/// 应用配置提供者

abstract class _$AppConfig extends $Notifier<Map<String, dynamic>> {
  Map<String, dynamic> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Map<String, dynamic>, Map<String, dynamic>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Map<String, dynamic>, Map<String, dynamic>>,
        Map<String, dynamic>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

/// 示例计数器提供者

@ProviderFor(Counter)
const counterProvider = CounterProvider._();

/// 示例计数器提供者
final class CounterProvider extends $NotifierProvider<Counter, int> {
  /// 示例计数器提供者
  const CounterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'counterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$counterHash();

  @$internal
  @override
  Counter create() => Counter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$counterHash() => r'e8eb012fd27833cc64562f0bc36d2c7e87249a48';

/// 示例计数器提供者

abstract class _$Counter extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element = ref.element
        as $ClassProviderElement<AnyNotifier<int, int>, int, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

/// 主题模式提供者

@ProviderFor(AppThemeMode)
const appThemeModeProvider = AppThemeModeProvider._();

/// 主题模式提供者
final class AppThemeModeProvider
    extends $NotifierProvider<AppThemeMode, ThemeMode> {
  /// 主题模式提供者
  const AppThemeModeProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'appThemeModeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$appThemeModeHash();

  @$internal
  @override
  AppThemeMode create() => AppThemeMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$appThemeModeHash() => r'863153e2d60198e833c69475c595d6cb53684c06';

/// 主题模式提供者

abstract class _$AppThemeMode extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ThemeMode, ThemeMode>, ThemeMode, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

/// 当前主题数据提供者

@ProviderFor(currentTheme)
const currentThemeProvider = CurrentThemeProvider._();

/// 当前主题数据提供者

final class CurrentThemeProvider
    extends $FunctionalProvider<ThemeData, ThemeData, ThemeData>
    with $Provider<ThemeData> {
  /// 当前主题数据提供者
  const CurrentThemeProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'currentThemeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$currentThemeHash();

  @$internal
  @override
  $ProviderElement<ThemeData> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeData create(Ref ref) {
    return currentTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeData>(value),
    );
  }
}

String _$currentThemeHash() => r'10c018c22f8f117e82ce8ff675853861eb23278f';
