import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'repo/game_repo.dart';

part 'hot_games.g.dart';

// 仓库实例（普通 Provider）
final gameRepoProvider = Provider<GameRepo>((_) => GameRepo());

// ✅ 方案 A：默认 autoDispose（离开页面回收，下次再进会重拉）
// @riverpod
// class HotGames extends _$HotGames {

// ✅ 方案 B：持久化缓存（Tab 来回切换/返回列表时不丢数据）
@Riverpod(keepAlive: true)
class HotGames extends _$HotGames {
  @override
  FutureOr<List<String>> build() async {
    final repo = ref.read(gameRepoProvider);
    // 返回值会自动包成 AsyncData(...)
    return repo.fetchHotGames();
  }

  // 主动刷新：下拉刷新/按钮触发都可以用它
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(gameRepoProvider).fetchHotGames(),
    );
  }
}

class HotGamesPage extends ConsumerWidget {
  const HotGamesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncGames = ref.watch(hotGamesProvider); // AsyncValue<List<String>>

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hot Games'),
        actions: [
          IconButton(
            onPressed: () => ref.read(hotGamesProvider.notifier).refresh(),
            tooltip: 'Refresh',
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(hotGamesProvider.notifier).refresh(),
        child: asyncGames.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, st) => ListView(
            children: [
              const SizedBox(height: 80),
              Icon(Icons.wifi_off, size: 48, color: Theme.of(context).hintColor),
              const SizedBox(height: 12),
              Center(child: Text('Oops: $err')),
              const SizedBox(height: 12),
              Center(
                child: FilledButton.icon(
                  onPressed: () => ref.read(hotGamesProvider.notifier).refresh(),
                  icon: const Icon(Icons.refresh),
                  label: const Text('重试'),
                ),
              ),
            ],
          ),
          data: (games) => ListView.separated(
            itemCount: games.length,
            itemBuilder: (_, i) => ListTile(
              leading: CircleAvatar(child: Text('${i + 1}')),
              title: Text(games[i]),
            ),
            separatorBuilder: (_, __) => const Divider(height: 0),
          ),
        ),
      ),
    );
  }
}
