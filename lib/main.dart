import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kidflow/hot_games.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'global_providers.dart';

part 'main.g.dart';

// 使用代码生成器来生成NotifierProvider的代码
@riverpod
class Count extends _$Count {
  @override
  int build() => 0;
  void increment() => state++;
  void reset() => state = 0;
}

void main() => runApp(
      UncontrolledProviderScope(
        container: globalContainer,
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: HotGamesPage(),
    );
  }
}

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 订阅并读取countProvider的状态，如果状态发生变化，界面会自动更新
    final count = ref.watch(countProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Count: $count')),
      body: Center(
        child: FilledButton(
          onPressed: () => ref.read(countProvider.notifier).reset(),
          child: const Text('Reset'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(countProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
