import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

@riverpod
class Count extends _$Count {
  @override
  int build() => 0;
  void increment() => state++;
  void reset() => state = 0;
}

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: CounterPage(),
    );
  }
}

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
