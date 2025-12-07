import 'package:flutter_complete_project/core/network/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

@Freezed()
 class ApiResult<T> with _$ApiResult<T> {

  /// ApiResult.success -> constructor name
  /// (T data) -> يعني بتاخد اي نوع بحدده (T) معناه النجاح بيستقبل بيانات نوعها
  /// Success<T>; -> Success اسمه class هيولّد Freezed
  /// Success<T>; -> (Success Class) استخدم ال .success واحنا بنقوله لو المستخدم نادي علي

  factory ApiResult.success(T data) = Success<T>;

  factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;
}
