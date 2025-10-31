import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutterx2/app/data/env_config.dart';
import 'package:flutterx2/app/data/sources/local/local_source_provider.dart';
import 'package:flutterx2/app/data/sources/remote/remote_source.dart';
import 'package:flutterx2/app/data/sources/remote/api_client.dart';

part 'remote_source_provider.g.dart';

/// Provide RemoteSource instance
@riverpod
RemoteSource remoteSource(Ref ref) {
  final localSource = ref.watch(localSourceProvider);
  return RemoteSourceImpl(localSource);
}

/// Provide Dio instance
@riverpod
Dio dio(Ref ref) {
  final remoteSource = ref.watch(remoteSourceProvider);
  return remoteSource.dio;
}

/// Provide ApiClient instance
@riverpod
ApiClient apiClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  final baseUrl = EnvConfig.instance.baseUrl;
  return ApiClient(dio, baseUrl: baseUrl);
}
