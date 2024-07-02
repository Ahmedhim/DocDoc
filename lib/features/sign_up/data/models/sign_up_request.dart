import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  final String email;
  final String password;
  final String name;
  @JsonKey(name: 'phone')
  final String phoneNumber;
  final String gender;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;

  SignUpRequest(
    
      {required this.email,
     required this.gender, 
      required this.password,
      required this.name,
      required this.phoneNumber,
      required this.passwordConfirmation});

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
