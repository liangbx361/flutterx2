// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kidflow/main.dart';
import 'package:kidflow/global_providers.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build the CounterPage inside a MaterialApp so Directionality/Theme exist,
    // and use the global ProviderContainer for providers.
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: globalContainer,
        child: const MaterialApp(home: CounterPage()),
      ),
    );

    // Verify that our counter starts at 0 (AppBar title shows Count: 0).
    expect(find.text('Count: 0'), findsOneWidget);
    expect(find.text('Count: 1'), findsNothing);

    // Tap the FAB (plus) and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Count: 0'), findsNothing);
    expect(find.text('Count: 1'), findsOneWidget);
  });
}
