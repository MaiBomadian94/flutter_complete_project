import 'package:flutter_complete_project/core/network/api_result.dart';
import 'package:flutter_complete_project/core/network/api_service.dart';
import 'package:flutter_complete_project/features/register/data/models/sign_up_request_body.dart';

import '../../../../core/network/api_error_handler.dart';
import '../models/sign_up_response.dart';

class SignUpRepository {
  final ApiService _apiService;

  SignUpRepository(this._apiService);

  Future<ApiResult<SignUpResponse>> signUp(
    SignUpRequestBody signUpRequestBody,
  ) async {
    try {
      final response = await _apiService.signUp(signUpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
