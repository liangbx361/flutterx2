// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_source_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provide RemoteSource instance

@ProviderFor(remoteSource)
const remoteSourceProvider = RemoteSourceProvider._();

/// Provide RemoteSource instance

final class RemoteSourceProvider
    extends $FunctionalProvider<RemoteSource, RemoteSource, RemoteSource>
    with $Provider<RemoteSource> {
  /// Provide RemoteSource instance
  const RemoteSourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'remoteSourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$remoteSourceHash();

  @$internal
  @override
  $ProviderElement<RemoteSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RemoteSource create(Ref ref) {
    return remoteSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RemoteSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RemoteSource>(value),
    );
  }
}

String _$remoteSourceHash() => r'29c642abbd8d4b9e1f9f36848daed339275f1a82';

/// Provide Dio instance

@ProviderFor(dio)
const dioProvider = DioProvider._();

/// Provide Dio instance

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  /// Provide Dio instance
  const DioProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dioProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'49e7b1e9ea810f1fc82975245b9d803686f0cd70';

/// Provide ApiClient instance

@ProviderFor(apiClient)
const apiClientProvider = ApiClientProvider._();

/// Provide ApiClient instance

final class ApiClientProvider
    extends $FunctionalProvider<ApiClient, ApiClient, ApiClient>
    with $Provider<ApiClient> {
  /// Provide ApiClient instance
  const ApiClientProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'apiClientProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$apiClientHash();

  @$internal
  @override
  $ProviderElement<ApiClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiClient create(Ref ref) {
    return apiClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiClient>(value),
    );
  }
}

String _$apiClientHash() => r'fff92c8f6ae83e08d82a727bb5cb71125db761e2';
