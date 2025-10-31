// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsive_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 设备类型 Provider
/// 注意：由于需要 BuildContext，这个 provider 需要在 Widget 中使用
/// 使用方式：ref.watch(deviceTypeProvider(context))

@ProviderFor(deviceType)
const deviceTypeProvider = DeviceTypeFamily._();

/// 设备类型 Provider
/// 注意：由于需要 BuildContext，这个 provider 需要在 Widget 中使用
/// 使用方式：ref.watch(deviceTypeProvider(context))

final class DeviceTypeProvider
    extends $FunctionalProvider<DeviceType, DeviceType, DeviceType>
    with $Provider<DeviceType> {
  /// 设备类型 Provider
  /// 注意：由于需要 BuildContext，这个 provider 需要在 Widget 中使用
  /// 使用方式：ref.watch(deviceTypeProvider(context))
  const DeviceTypeProvider._(
      {required DeviceTypeFamily super.from,
      required BuildContext super.argument})
      : super(
          retry: null,
          name: r'deviceTypeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deviceTypeHash();

  @override
  String toString() {
    return r'deviceTypeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<DeviceType> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeviceType create(Ref ref) {
    final argument = this.argument as BuildContext;
    return deviceType(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceType>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeviceTypeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deviceTypeHash() => r'8a7d69e053e68eb074a00fb33fdbe72123653f04';

/// 设备类型 Provider
/// 注意：由于需要 BuildContext，这个 provider 需要在 Widget 中使用
/// 使用方式：ref.watch(deviceTypeProvider(context))

final class DeviceTypeFamily extends $Family
    with $FunctionalFamilyOverride<DeviceType, BuildContext> {
  const DeviceTypeFamily._()
      : super(
          retry: null,
          name: r'deviceTypeProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// 设备类型 Provider
  /// 注意：由于需要 BuildContext，这个 provider 需要在 Widget 中使用
  /// 使用方式：ref.watch(deviceTypeProvider(context))

  DeviceTypeProvider call(
    BuildContext context,
  ) =>
      DeviceTypeProvider._(argument: context, from: this);

  @override
  String toString() => r'deviceTypeProvider';
}

/// 屏幕宽度 Provider

@ProviderFor(screenWidth)
const screenWidthProvider = ScreenWidthFamily._();

/// 屏幕宽度 Provider

final class ScreenWidthProvider
    extends $FunctionalProvider<double, double, double> with $Provider<double> {
  /// 屏幕宽度 Provider
  const ScreenWidthProvider._(
      {required ScreenWidthFamily super.from,
      required BuildContext super.argument})
      : super(
          retry: null,
          name: r'screenWidthProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$screenWidthHash();

  @override
  String toString() {
    return r'screenWidthProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    final argument = this.argument as BuildContext;
    return screenWidth(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ScreenWidthProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$screenWidthHash() => r'f37efa255f94dfc03ca7aa56217ac41a3d1dff3b';

/// 屏幕宽度 Provider

final class ScreenWidthFamily extends $Family
    with $FunctionalFamilyOverride<double, BuildContext> {
  const ScreenWidthFamily._()
      : super(
          retry: null,
          name: r'screenWidthProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// 屏幕宽度 Provider

  ScreenWidthProvider call(
    BuildContext context,
  ) =>
      ScreenWidthProvider._(argument: context, from: this);

  @override
  String toString() => r'screenWidthProvider';
}

/// 屏幕高度 Provider

@ProviderFor(screenHeight)
const screenHeightProvider = ScreenHeightFamily._();

/// 屏幕高度 Provider

final class ScreenHeightProvider
    extends $FunctionalProvider<double, double, double> with $Provider<double> {
  /// 屏幕高度 Provider
  const ScreenHeightProvider._(
      {required ScreenHeightFamily super.from,
      required BuildContext super.argument})
      : super(
          retry: null,
          name: r'screenHeightProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$screenHeightHash();

  @override
  String toString() {
    return r'screenHeightProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    final argument = this.argument as BuildContext;
    return screenHeight(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ScreenHeightProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$screenHeightHash() => r'8a7394a6b4a419579ca987b7cfdd5d103f3f672b';

/// 屏幕高度 Provider

final class ScreenHeightFamily extends $Family
    with $FunctionalFamilyOverride<double, BuildContext> {
  const ScreenHeightFamily._()
      : super(
          retry: null,
          name: r'screenHeightProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// 屏幕高度 Provider

  ScreenHeightProvider call(
    BuildContext context,
  ) =>
      ScreenHeightProvider._(argument: context, from: this);

  @override
  String toString() => r'screenHeightProvider';
}

/// 是否为移动端 Provider

@ProviderFor(isMobile)
const isMobileProvider = IsMobileFamily._();

/// 是否为移动端 Provider

final class IsMobileProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// 是否为移动端 Provider
  const IsMobileProvider._(
      {required IsMobileFamily super.from,
      required BuildContext super.argument})
      : super(
          retry: null,
          name: r'isMobileProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isMobileHash();

  @override
  String toString() {
    return r'isMobileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as BuildContext;
    return isMobile(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsMobileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isMobileHash() => r'80a54f7fc837bad579f062b5665ce1479078eb09';

/// 是否为移动端 Provider

final class IsMobileFamily extends $Family
    with $FunctionalFamilyOverride<bool, BuildContext> {
  const IsMobileFamily._()
      : super(
          retry: null,
          name: r'isMobileProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// 是否为移动端 Provider

  IsMobileProvider call(
    BuildContext context,
  ) =>
      IsMobileProvider._(argument: context, from: this);

  @override
  String toString() => r'isMobileProvider';
}

/// 是否为平板 Provider

@ProviderFor(isTablet)
const isTabletProvider = IsTabletFamily._();

/// 是否为平板 Provider

final class IsTabletProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// 是否为平板 Provider
  const IsTabletProvider._(
      {required IsTabletFamily super.from,
      required BuildContext super.argument})
      : super(
          retry: null,
          name: r'isTabletProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isTabletHash();

  @override
  String toString() {
    return r'isTabletProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as BuildContext;
    return isTablet(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsTabletProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isTabletHash() => r'b8108e2e2c0deb8d355acee1df0e5a9d5a1c5d2e';

/// 是否为平板 Provider

final class IsTabletFamily extends $Family
    with $FunctionalFamilyOverride<bool, BuildContext> {
  const IsTabletFamily._()
      : super(
          retry: null,
          name: r'isTabletProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// 是否为平板 Provider

  IsTabletProvider call(
    BuildContext context,
  ) =>
      IsTabletProvider._(argument: context, from: this);

  @override
  String toString() => r'isTabletProvider';
}

/// 是否为桌面端 Provider

@ProviderFor(isDesktop)
const isDesktopProvider = IsDesktopFamily._();

/// 是否为桌面端 Provider

final class IsDesktopProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// 是否为桌面端 Provider
  const IsDesktopProvider._(
      {required IsDesktopFamily super.from,
      required BuildContext super.argument})
      : super(
          retry: null,
          name: r'isDesktopProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isDesktopHash();

  @override
  String toString() {
    return r'isDesktopProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as BuildContext;
    return isDesktop(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsDesktopProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isDesktopHash() => r'5169bf9d9466292eea2cda7dfa22d0ff290606aa';

/// 是否为桌面端 Provider

final class IsDesktopFamily extends $Family
    with $FunctionalFamilyOverride<bool, BuildContext> {
  const IsDesktopFamily._()
      : super(
          retry: null,
          name: r'isDesktopProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// 是否为桌面端 Provider

  IsDesktopProvider call(
    BuildContext context,
  ) =>
      IsDesktopProvider._(argument: context, from: this);

  @override
  String toString() => r'isDesktopProvider';
}
