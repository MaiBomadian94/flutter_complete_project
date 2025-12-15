import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/app_regex.dart';
import 'package:flutter_complete_project/features/register/presentation/sign_up_cubit/sign_up_cubit.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/presentation/widgets/custom_text_form_field.dart';
import '../../../../login/presentation/view/widgets/password_validation_widget.dart';

class SignUpFormSection extends StatefulWidget {
  const SignUpFormSection({super.key});

  @override
  State<SignUpFormSection> createState() => _SignUpFormSectionState();
}

class _SignUpFormSectionState extends State<SignUpFormSection> {
  bool isObscurePassword = true;

  bool isObscureConfirmPass = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
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
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<SignUpCubit>().nameController,
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
          ),
          verticalSpace(height: 16),
          CustomTextFormField(
            controller: context.read<SignUpCubit>().emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email address';
              }
            },
          ),
          verticalSpace(height: 16),
          CustomTextFormField(
            controller: context.read<SignUpCubit>().phoneController,
            hintText: 'Phone',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
          ),
          verticalSpace(height: 16),
          CustomTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            hintText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
            isObscureText: isObscurePassword,
            suffixIcon: GestureDetector(
              child: Icon(
                isObscurePassword ? Icons.visibility_off : Icons.visibility,
              ),
              onTap: () {
                setState(() {
                  isObscurePassword = !isObscurePassword;
                });
              },
            ),
          ),
          verticalSpace(height: 16),
          CustomTextFormField(
            controller: context.read<SignUpCubit>().confirmPassController,
            hintText: 'Confirm Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
            isObscureText: isObscureConfirmPass,
            suffixIcon: GestureDetector(
              child: Icon(
                isObscureConfirmPass ? Icons.visibility_off : Icons.visibility,
              ),
              onTap: () {
                setState(() {
                  isObscureConfirmPass = !isObscureConfirmPass;
                });
              },
            ),
          ),
          verticalSpace(height: 32),
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
