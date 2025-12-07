import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String? message;
  final Data? data;
  final bool? status;
  final int? code;

  LoginResponse({this.message, this.data, this.status, this.code});

  factory LoginResponse.fromJson(Map<String, dynamic> jsonData) =>
      _$LoginResponseFromJson(jsonData);
}

@JsonSerializable()
class Data {
  final String? token;

  @JsonKey(name: 'username')
  final String? userName;

  Data({this.token, this.userName});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
