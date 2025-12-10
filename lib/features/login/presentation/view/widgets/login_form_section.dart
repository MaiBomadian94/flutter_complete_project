import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/app_regex.dart';
import 'package:flutter_complete_project/features/login/presentation/login_cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/login/presentation/view/widgets/password_validation_widget.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/presentation/widgets/custom_text_form_field.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  late TextEditingController passwordController;

  bool isObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;

    passwordControllerListener();
  }

  void passwordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<LoginCubit>().emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          verticalSpace(height: 16),
          CustomTextFormField(
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
            ),
            controller: context.read<LoginCubit>().passwordController,
            hintText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
          verticalSpace(height: 16),
          PasswordValidationWidget(
            hasLowerCase: hasLowercase,
            hasMinLength: hasMinLength,
            hasNumber: hasNumber,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
