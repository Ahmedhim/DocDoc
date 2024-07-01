import 'package:docdoc_project/core/network/api_error_handler.dart';
import 'package:docdoc_project/core/network/api_result.dart';
import 'package:docdoc_project/core/network/api_service.dart';
import 'package:docdoc_project/features/login/data/model/login_request.dart';
import 'package:docdoc_project/features/login/data/model/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);


  Future<ApiResult<LoginResponse>> login( LoginRequest loginRequest) async {
    try {
      final response = await _apiService.login(loginRequest);
      return ApiResult.success(response);
    } catch (error) {
   return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
