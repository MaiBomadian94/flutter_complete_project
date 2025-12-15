import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/network/api_result.dart';
import 'package:flutter_complete_project/features/register/data/models/sign_up_request_body.dart';
import 'package:flutter_complete_project/features/register/data/repositories/sign_up_repo.dart';
import 'package:flutter_complete_project/features/register/presentation/sign_up_cubit/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  final SignUpRepository signUpRepository;

  SignUpCubit(this.signUpRepository) : super(SignUpStates.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();


  GlobalKey<FormState> formKey = GlobalKey();

  signUp() async {
    emit(SignUpStates.loading());
    final response = await signUpRepository.signUp(
        SignUpRequestBody(name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          gender: 0,
          password: passwordController.text,
          passwordConfirm: confirmPassController.text,)
    );

    return response.when(
      success: (success) => emit(SignUpStates.success(success)),
      failure: (error) =>
          emit(SignUpStates.failure(error: error.apiErrorModel.message ?? '')),
    );
  }
}
