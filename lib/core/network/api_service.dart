import 'package:dio/dio.dart';
import 'package:docdoc_project/core/network/api_constants.dart';
import 'package:docdoc_project/features/login/data/model/login_request.dart';
import 'package:docdoc_project/features/login/data/model/login_response.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  
  factory ApiService(Dio dio,{String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequest loginRequest
    );

}
