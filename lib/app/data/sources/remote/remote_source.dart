import 'package:dio/dio.dart';
import 'package:flutterx2/app/data/env_config.dart';
import 'package:flutterx2/app/data/sources/local/local_source.dart';
import 'package:flutterx2/app/data/sources/remote/interceptors/auth_interceptor.dart';
import 'package:flutterx2/app/data/sources/remote/interceptors/retry_interceptor.dart';
import 'package:flutter/foundation.dart';

abstract class RemoteSource {
  Dio get dio;
}

class RemoteSourceImpl implements RemoteSource {
  late final Dio _dio;
  final LocalSource _localSource;

  RemoteSourceImpl(this._localSource) {
    _dio = createDio();
  }

  @override
  Dio get dio => _dio;

  Dio createDio() {
    final baseUrl = EnvConfig.instance.baseUrl;

    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        responseType: ResponseType.json,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    // Add interceptors in order: logging -> auth -> retry
    dio.interceptors.addAll([
      // Use Dio's built-in LogInterceptor (debug mode only)
      if (kDebugMode)
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
          error: true,
        ),
      AuthInterceptor(_localSource),
      RetryInterceptor(
        maxRetries: 3,
        initialDelay: const Duration(seconds: 1),
        backoffMultiplier: 2.0,
      ),
    ]);

    return dio;
  }
}
