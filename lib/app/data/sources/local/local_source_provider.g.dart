// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_source_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// LocalSource provider
///
/// Provides singleton instance of HiveLocalSource for app-wide local storage.
/// Must call init() before first use (typically in app startup).

@ProviderFor(localSource)
const localSourceProvider = LocalSourceProvider._();

/// LocalSource provider
///
/// Provides singleton instance of HiveLocalSource for app-wide local storage.
/// Must call init() before first use (typically in app startup).

final class LocalSourceProvider
    extends $FunctionalProvider<LocalSource, LocalSource, LocalSource>
    with $Provider<LocalSource> {
  /// LocalSource provider
  ///
  /// Provides singleton instance of HiveLocalSource for app-wide local storage.
  /// Must call init() before first use (typically in app startup).
  const LocalSourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'localSourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$localSourceHash();

  @$internal
  @override
  $ProviderElement<LocalSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocalSource create(Ref ref) {
    return localSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalSource>(value),
    );
  }
}

String _$localSourceHash() => r'c984faf2c814e15d7856ed3a0b62e3dbe73434d6';
