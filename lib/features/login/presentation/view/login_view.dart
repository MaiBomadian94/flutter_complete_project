import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/text_styles.dart';
import 'package:flutter_complete_project/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/login/presentation/login_cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/login/presentation/view/widgets/do_not_have_account_widget.dart';
import 'package:flutter_complete_project/features/login/presentation/view/widgets/login_bloc_listener.dart';
import 'package:flutter_complete_project/features/login/presentation/view/widgets/login_form_section.dart';
import 'package:flutter_complete_project/features/login/presentation/view/widgets/terms_and_conditions_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: Styles.textTitle24Bold.copyWith(
                    color: AppColors.mainBlue,
                  ),
                ),
                verticalSpace(height: 8),
                Text(
                  "We're excited to have you back, can't wait to \nsee what you've been up to since you last\n logged in.",
                  style: Styles.textTitle14Regular.copyWith(
                    color: AppColors.greyColor,
                    height: 2,
                    letterSpacing: .2,
                  ),
                ),
                verticalSpace(height: 36),
                Column(
                  children: [
                    const LoginFormSection(),
                    verticalSpace(height: 16),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: Styles.textTitle12Regular.copyWith(
                          color: AppColors.mainBlue,
                        ),
                      ),
                    ),
                    verticalSpace(height: 32),
                    CustomElevatedButton(
                      title: 'Login',
                      backgroundColor: AppColors.mainBlue,
                      onPressed: () => checkLoginValidation(context),
                    ),
                    verticalSpace(height: 32),
                    const TermsAndConditionsWidget(),
                    verticalSpace(height: 32),
                    const Center(child: DontHaveAccountWidget()),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLoginValidation(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
        LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text,
        ),
      );
    }
  }
}
