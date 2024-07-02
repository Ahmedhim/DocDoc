// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      message: json['message'] as String,
      status: json['status'] as bool,
      code: (json['code'] as num).toInt(),
      data: json['data'] == null
          ? null
          : UserSignData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
      'code': instance.code,
    };

UserSignData _$UserSignDataFromJson(Map<String, dynamic> json) => UserSignData(
      token: json['token'] as String,
      userName: json['username'] as String,
    );

Map<String, dynamic> _$UserSignDataToJson(UserSignData instance) =>
    <String, dynamic>{
      'token': instance.token,
      'username': instance.userName,
    };
