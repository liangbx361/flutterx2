import 'package:dio/dio.dart';
import 'package:flutterx2/app/data/sources/local/local_source.dart';

/// Auth interceptor for adding bearer token
class AuthInterceptor extends Interceptor {
  final LocalSource _localSource;

  AuthInterceptor(this._localSource);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      // Get token from local storage
      final token = await _localSource.getConfig('auth_token');

      if (token != null && token is String && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (e) {
      // Continue without token if error
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 unauthorized - token might be expired
    if (err.response?.statusCode == 401) {
      // Clear expired token
      try {
        await _localSource.deleteConfig('auth_token');
      } catch (e) {
        // Ignore error
      }
    }

    super.onError(err, handler);
  }
}
