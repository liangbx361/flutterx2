import 'package:dio/dio.dart';

/// Network exception with error details
class NetworkException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;
  final DioExceptionType? type;

  NetworkException({
    required this.message,
    this.statusCode,
    this.data,
    this.type,
  });

  @override
  String toString() => 'NetworkException: $message (status: $statusCode)';
}

/// API response exception
class ApiException implements Exception {
  final String message;
  final int code;
  final dynamic data;

  ApiException({
    required this.message,
    required this.code,
    this.data,
  });

  @override
  String toString() => 'ApiException: $message (code: $code)';
}

/// Network exception handler
class ExceptionHandler {
  /// Convert DioException to NetworkException
  static NetworkException fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkException(
          message: 'Connection timeout',
          type: error.type,
        );
      case DioExceptionType.sendTimeout:
        return NetworkException(
          message: 'Send timeout',
          type: error.type,
        );
      case DioExceptionType.receiveTimeout:
        return NetworkException(
          message: 'Receive timeout',
          type: error.type,
        );
      case DioExceptionType.badResponse:
        return NetworkException(
          message: _parseErrorMessage(error.response),
          statusCode: error.response?.statusCode,
          data: error.response?.data,
          type: error.type,
        );
      case DioExceptionType.cancel:
        return NetworkException(
          message: 'Request cancelled',
          type: error.type,
        );
      case DioExceptionType.unknown:
        return NetworkException(
          message: error.message ?? 'Unknown network error',
          type: error.type,
        );
      default:
        return NetworkException(
          message: 'Network error occurred',
          type: error.type,
        );
    }
  }

  /// Parse error message from response
  static String _parseErrorMessage(Response? response) {
    if (response == null) return 'Unknown error';

    final data = response.data;
    if (data is Map<String, dynamic>) {
      return data['message'] ?? data['error'] ?? 'Server error';
    }

    return 'HTTP ${response.statusCode}';
  }
}
