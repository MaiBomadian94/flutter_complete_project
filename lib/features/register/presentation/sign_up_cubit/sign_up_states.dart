import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_states.freezed.dart';

@freezed
class SignUpStates<T> with _$SignUpStates<T>{
  factory SignUpStates.initial() = _Initial;
  factory SignUpStates.loading() = Loading;
factory SignUpStates.success(T data ) = Success<T>;
  factory SignUpStates.failure({required String error}) = Failure;

}