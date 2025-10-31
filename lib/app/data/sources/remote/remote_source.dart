import 'package:dio/dio.dart';

abstract class RemoteSource {}

class RemoteSourceImpl implements RemoteSource {
  late final Dio _dio;

  RemoteSourceImpl() {
    _dio = createDio("https://api.example.com");
  }

  Dio createDio(String baseUrl) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        responseType: ResponseType.json,
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    // dio.interceptors.addAll([
    //   // 统一鉴权拦截
    //   InterceptorsWrapper(onRequest: (options, handler) async {
    //     final token = await loadToken(); // 自己实现
    //     if (token != null) {
    //       options.headers['Authorization'] = 'Bearer $token';
    //     }
    //     handler.next(options);
    //   }),
    //   // 日志（开发环境再开）
    //   LogInterceptor(requestBody: true, responseBody: false),
    //   // 简单重试：仅对 GET/HEAD，指数退避
    //   _RetryOnNetworkError(
    //     shouldRetry: (r) => ['GET', 'HEAD'].contains(r.requestOptions.method),
    //     maxAttempts: 3,
    //   ),
    // ]);

    return dio;
  }
}
