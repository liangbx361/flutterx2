import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutterx2/app/data/sources/local/local_source.dart';
import 'package:flutterx2/app/data/sources/local/hive_local_source.dart';

part 'local_source_provider.g.dart';

/// LocalSource provider
///
/// Provides singleton instance of HiveLocalSource for app-wide local storage.
/// Must call init() before first use (typically in app startup).
@riverpod
LocalSource localSource(Ref ref) {
  return HiveLocalSource();
}
