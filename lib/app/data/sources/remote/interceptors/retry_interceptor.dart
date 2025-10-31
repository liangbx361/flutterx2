import 'dart:math' as math;
import 'package:dio/dio.dart';

/// Retry interceptor for handling network errors with exponential backoff
class RetryInterceptor extends Interceptor {
  final int maxRetries;
  final Duration initialDelay;
  final double backoffMultiplier;

  RetryInterceptor({
    this.maxRetries = 3,
    this.initialDelay = const Duration(seconds: 1),
    this.backoffMultiplier = 2.0,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Only retry on network errors or 5xx server errors
    if (!_shouldRetry(err)) {
      return handler.next(err);
    }

    final extra = err.requestOptions.extra;
    final retryCount = extra['retry_count'] ?? 0;

    if (retryCount >= maxRetries) {
      return handler.next(err);
    }

    // Calculate delay with exponential backoff
    final delay = _calculateDelay(retryCount);
    await Future.delayed(delay);

    // Update retry count
    err.requestOptions.extra['retry_count'] = retryCount + 1;

    // Retry the request
    try {
      final response = await Dio().fetch(err.requestOptions);
      return handler.resolve(response);
    } on DioException catch (e) {
      return handler.next(e);
    }
  }

  /// Check if the error should be retried
  bool _shouldRetry(DioException error) {
    // Retry on connection errors
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.unknown) {
      return true;
    }

    // Retry on 5xx server errors
    final statusCode = error.response?.statusCode;
    if (statusCode != null && statusCode >= 500) {
      return true;
    }

    return false;
  }

  /// Calculate retry delay with exponential backoff
  Duration _calculateDelay(int retryCount) {
    final multiplier = math.pow(backoffMultiplier, retryCount);
    final delayMs = initialDelay.inMilliseconds * multiplier;
    return Duration(milliseconds: delayMs.toInt());
  }
}
