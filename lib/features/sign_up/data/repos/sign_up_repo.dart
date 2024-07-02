import 'package:docdoc_project/core/network/api_error_handler.dart';
import 'package:docdoc_project/core/network/api_result.dart';
import 'package:docdoc_project/core/network/api_service.dart';
import 'package:docdoc_project/features/sign_up/data/models/sign_up_request.dart';
import 'package:docdoc_project/features/sign_up/data/models/sign_up_response.dart';

class SignUpRepo {
  final ApiService _apiService;
  SignUpRepo(this._apiService);

  Future<ApiResult<SignUpResponse>> signUp(SignUpRequest signUpRequest) async {
    try {
      final response = await _apiService.signUp(signUpRequest);
      return ApiResult.success(response);
    }
     catch (error) {
       return ApiResult.failure(ErrorHandler.handle(error));
     }
  }
}
