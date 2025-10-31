/// API endpoint path constants
class ApiPath {
  ApiPath._();

  // Authentication
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String register = '/auth/register';
  static const String refreshToken = '/auth/refresh';

  // User
  static const String userProfile = '/user/profile';
  static const String updateProfile = '/user/profile/update';
  static const String changePassword = '/user/password/change';

  // Common
  static const String config = '/config';
  static const String version = '/version';
}
