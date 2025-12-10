import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/network/api_service.dart';
import 'package:flutter_complete_project/core/network/dio_factory.dart';
import 'package:flutter_complete_project/features/login/presentation/login_cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/register/data/repositories/sign_up_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/data/repositories/login_repo.dart';

final getIt = GetIt.instance;

Future<void> setUpInjection() async {
  // Dio & ApiService

  Dio dio = await DioFactory.getDio();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login injections

  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));


  // sign up injections
  getIt.registerLazySingleton<SignUpRepository>(() => SignUpRepository(getIt()));

}
