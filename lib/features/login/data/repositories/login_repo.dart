import 'package:flutter_complete_project/core/network/api_error_handler.dart';
import 'package:flutter_complete_project/core/network/api_result.dart';
import 'package:flutter_complete_project/core/network/api_service.dart';
import 'package:flutter_complete_project/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/login/data/models/login_response.dart';

class LoginRepository {
  final ApiService _apiService;

  LoginRepository(this._apiService);

  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
