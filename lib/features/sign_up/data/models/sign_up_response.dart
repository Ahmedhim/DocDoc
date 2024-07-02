import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  final String message;
  UserSignData? data;
  final bool status;
  final int code;

  SignUpResponse(
      {required this.message,
      required this.status,
      required this.code,
      this.data});
  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class UserSignData {
  final String token;
  @JsonKey(name: 'username')
  final String userName;

  UserSignData({required this.token, required this.userName});

  factory UserSignData.fromJson(Map<String, dynamic> json) =>_$UserSignDataFromJson(json);
}
