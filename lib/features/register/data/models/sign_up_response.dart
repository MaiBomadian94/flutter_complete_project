import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()

class SignUpResponse {
  final String? message;
  final Data? data;
  final bool? status;
  final int? code;

  SignUpResponse({this.message,this.data,this.code,this.status});

  factory SignUpResponse.fromJson(Map<String, dynamic> jsonData) => _$SignUpResponseFromJson(jsonData);

}

@JsonSerializable()
class Data {
  final String? token;
  @JsonKey(name: 'username')
  final String? userName;

  Data({ this.token,  this.userName});

  factory Data.fromJson(Map<String, dynamic> jsonData) => _$DataFromJson(jsonData);

}
