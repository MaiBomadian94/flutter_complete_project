import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/network/api_result.dart';
import 'package:flutter_complete_project/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/login/data/repositories/login_repo.dart';
import 'package:flutter_complete_project/features/login/presentation/login_cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepository loginRepository;

  LoginCubit(this.loginRepository) : super(LoginStates.initial());

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  login(LoginRequestBody loginRequestBody) async {
    emit(LoginStates.loading());

    final response = await loginRepository.login(loginRequestBody);
    return response.when(
      success: (loginResponse) => emit(LoginStates.success(loginResponse)),
      failure: (error) =>
          emit(LoginStates.failure(error: error.apiErrorModel.message ?? '')),
    );
  }
}
