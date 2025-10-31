# FlutterX2 AI Coding Instructions

## Project Overview
FlutterX2 is a Flutter application using **Riverpod for state management** with code generation patterns. The project follows a clean architecture inspired by GetX patterns but adapted for Riverpod.

## Architecture Patterns

### State Management with Riverpod
- Use `@riverpod` annotation with code generation for providers
- Generated files follow `.g.dart` pattern (e.g., `main.g.dart`)
- All providers use `riverpod_annotation` instead of manual provider definitions
- Run `flutter packages pub run build_runner build` to generate provider code

### Testing Strategy
- **Global Container Pattern**: Use `globalContainer` and `UncontrolledProviderScope` for widget tests
- Mock providers using `container.overrideWith()` pattern in unit tests
- Test utilities in `test/test_providers.dart` provide `createTestContainer()` helper
- Example widget test setup:
  ```dart
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: globalContainer,
      child: const MaterialApp(home: YourWidget()),
    ),
  );
  ```

### Project Structure (lib/app/)
- **data/**: Business data layer following repository pattern
  - `sources/remote/`: API clients using Dio with base configuration
  - `repos/`: Repository implementations 
  - `models/`: Data models (local, remote, view models)
  - `enums/`: Business enumerations
- **modules/**: Feature modules (high cohesion, low coupling principle)
- **components/**: Reusable UI components
- **core/**: Cross-app reusable architecture and utilities
- **values/**: App resources (configs, colors, themes)

### Code Generation Dependencies
The project uses multiple code generators:
- `riverpod_generator`: For `@riverpod` providers
- `retrofit_generator`: For API client generation
- `json_serializable`: For model serialization
- `hive_ce_generator`: For local storage models

### Development Workflow
1. After adding `@riverpod` annotations, run: `flutter packages pub run build_runner build`
2. Use `flutter packages pub run build_runner watch` for continuous generation during development
3. Environment configuration loaded via `flutter_dotenv` from `.env` files

### Naming Conventions
- Directories: Use plural forms (`modules`, `services`)
- Files: `snake_case.dart`
- Classes: `PascalCase`
- Follow Flutter SDK naming patterns

### Key Integration Points
- **Initialization**: `lib/init.dart` handles app startup and environment configuration
- **App Entry**: `lib/app/app.dart` contains main app widget
- **Remote Data**: `RemoteSourceImpl` in `data/sources/remote/` provides configured Dio instance
- **Testing**: Global provider container enables consistent test setup across widget and integration tests

### Import Patterns
- Use package imports: `import 'package:flutterx2/...'` for cross-module references
- Relative imports for files within same directory/module
- Generated files require `part` directives for code generation

## Development Commands
- `flutter packages pub run build_runner build --delete-conflicting-outputs`
- `flutter test` (uses global container setup)
- `flutter analyze` (configured via `analysis_options.yaml`)