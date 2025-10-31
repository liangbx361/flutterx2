import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutterx2/app/data/sources/remote/api_path.dart';
import 'package:flutterx2/app/data/models/remote/api_response.dart';
import 'package:flutterx2/app/data/models/remote/auth_models.dart';

part 'api_client.g.dart';

/// Main API client using Retrofit
@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  // Auth endpoints
  @POST(ApiPath.login)
  Future<ApiResponse<LoginResponse>> login(
    @Body() LoginRequest body,
  );

  @POST(ApiPath.logout)
  Future<ApiResponse<void>> logout();

  @POST(ApiPath.register)
  Future<ApiResponse<LoginResponse>> register(
    @Body() LoginRequest body,
  );

  @POST(ApiPath.refreshToken)
  Future<ApiResponse<LoginResponse>> refreshToken(
    @Body() Map<String, dynamic> body,
  );

  // User endpoints
  @GET(ApiPath.userProfile)
  Future<ApiResponse<UserProfile>> getUserProfile();

  @PUT(ApiPath.updateProfile)
  Future<ApiResponse<UserProfile>> updateProfile(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiPath.changePassword)
  Future<ApiResponse<void>> changePassword(
    @Body() Map<String, dynamic> body,
  );

  // Common endpoints
  @GET(ApiPath.config)
  Future<HttpResponse<dynamic>> getConfig();

  @GET(ApiPath.version)
  Future<HttpResponse<dynamic>> getVersion();
}
