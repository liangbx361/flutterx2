// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kidflow/app/app_providers.dart';
import 'package:kidflow/app/modules/home/home_page.dart';
import 'test_providers.dart';

void main() {
  group('KidFlow App Tests', () {
    testWidgets('App should display welcome message with global container', (WidgetTester tester) async {
      // Build our app and trigger a frame using global container
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: getGlobalContainer(),
          child: const MaterialApp(home: HomePage()),
        ),
      );

      // Verify that our app displays the welcome message
      expect(find.text('Welcome to KidFlow!'), findsOneWidget);
      expect(find.text('Version: 0.1.0'), findsOneWidget);
    });

    testWidgets('Counter functionality test', (WidgetTester tester) async {
      // Create a test container for isolated testing
      final container = createTestContainer();

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: HomePage()),
        ),
      );

      // Initial counter should be 0
      expect(find.text('0'), findsOneWidget);

      // Find and tap the increment button
      final incrementButton = find.byIcon(Icons.add);
      await tester.tap(incrementButton);
      await tester.pump();

      // Counter should now be 1
      expect(find.text('1'), findsOneWidget);

      // Find and tap the decrement button
      final decrementButton = find.byIcon(Icons.remove);
      await tester.tap(decrementButton);
      await tester.pump();

      // Counter should be back to 0
      expect(find.text('0'), findsOneWidget);

      // Test reset button
      await tester.tap(incrementButton);
      await tester.tap(incrementButton);
      await tester.pump();
      expect(find.text('2'), findsOneWidget);

      final resetButton = find.byIcon(Icons.refresh);
      await tester.tap(resetButton);
      await tester.pump();
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('Theme toggle test', (WidgetTester tester) async {
      final container = createTestContainer();

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: HomePage()),
        ),
      );

      // Initially should be light mode
      expect(find.byIcon(Icons.dark_mode), findsOneWidget);

      // Tap theme toggle button
      await tester.tap(find.byIcon(Icons.dark_mode));
      await tester.pump();

      // Should now show light mode icon (because we're in dark mode)
      expect(find.byIcon(Icons.light_mode), findsOneWidget);
    });
  });

  group('Provider Unit Tests', () {
    test('AppConfig provider test', () {
      final container = createTestContainer();

      final appConfig = readFromContainer(container, appConfigProvider);
      expect(appConfig['appName'], 'KidFlow');
      expect(appConfig['version'], '0.1.0');
      expect(appConfig['environment'], 'development');

      // Test updating config
      container.read(appConfigProvider.notifier).updateConfig('newKey', 'newValue');
      final updatedConfig = readFromContainer(container, appConfigProvider);
      expect(updatedConfig['newKey'], 'newValue');
    });

    test('Counter provider test', () {
      final container = createTestContainer();

      // Initial value should be 0
      expect(readFromContainer(container, counterProvider), 0);

      // Test increment
      container.read(counterProvider.notifier).increment();
      expect(readFromContainer(container, counterProvider), 1);

      // Test decrement
      container.read(counterProvider.notifier).decrement();
      expect(readFromContainer(container, counterProvider), 0);

      // Test multiple increments
      container.read(counterProvider.notifier).increment();
      container.read(counterProvider.notifier).increment();
      expect(readFromContainer(container, counterProvider), 2);

      // Test reset
      container.read(counterProvider.notifier).reset();
      expect(readFromContainer(container, counterProvider), 0);
    });

    test('ThemeMode provider test', () {
      final container = createTestContainer();

      // Initial value should be system mode
      expect(readFromContainer(container, appThemeModeProvider), ThemeMode.system);

      // Test toggle
      container.read(appThemeModeProvider.notifier).toggle();
      expect(readFromContainer(container, appThemeModeProvider), ThemeMode.dark);

      // Test setting light mode
      container.read(appThemeModeProvider.notifier).setLight();
      expect(readFromContainer(container, appThemeModeProvider), ThemeMode.light);

      // Test setting dark mode
      container.read(appThemeModeProvider.notifier).setDark();
      expect(readFromContainer(container, appThemeModeProvider), ThemeMode.dark);
    });
  });
}
