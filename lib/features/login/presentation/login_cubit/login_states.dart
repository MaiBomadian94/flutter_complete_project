import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_states.freezed.dart';

@freezed
class LoginStates<T> with _$LoginStates<T> {
  factory LoginStates.initial() = _Initial;

  factory LoginStates.loading() = Loading;

  factory LoginStates.success(T data) = Success<T>;

  factory LoginStates.failure({required String error}) = Failure;
}
