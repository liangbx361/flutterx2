// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_games.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HotGames)
const hotGamesProvider = HotGamesProvider._();

final class HotGamesProvider
    extends $AsyncNotifierProvider<HotGames, List<String>> {
  const HotGamesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'hotGamesProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$hotGamesHash();

  @$internal
  @override
  HotGames create() => HotGames();
}

String _$hotGamesHash() => r'0df726c724997a6e988066c2c7c29cbcb159913b';

abstract class _$HotGames extends $AsyncNotifier<List<String>> {
  FutureOr<List<String>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<String>>, List<String>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<String>>, List<String>>,
        AsyncValue<List<String>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
