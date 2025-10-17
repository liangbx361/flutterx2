import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kidflow/repo/game_repo.dart';
import 'package:kidflow/hot_games.dart';

class MockGameRepo implements GameRepo {
  @override
  Future<List<String>> fetchHotGames() async => ['Mock Game A', 'Mock Game B'];
}

void main() {
  test('gameRepoProvider overridden returns mock data', () async {
    final container = ProviderContainer(overrides: [
      gameRepoProvider.overrideWithValue(MockGameRepo()),
    ]);
    addTearDown(container.dispose);

    final repo = container.read(gameRepoProvider);
    final games = await repo.fetchHotGames();

    expect(games, isA<List<String>>());
    expect(games.length, 2);
    expect(games.first, 'Mock Game A');
  });
}
