import 'package:flutter/material.dart';
import 'package:flutter_complete_project/features/register/presentation/view/widgets/sign_up_form_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/presentation/widgets/custom_elevated_button.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../login/presentation/view/widgets/do_not_have_account_widget.dart';
import '../../../login/presentation/view/widgets/terms_and_conditions_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Account',
                style: Styles.textTitle24Bold.copyWith(
                  color: AppColors.mainBlue,
                ),
              ),
              verticalSpace(height: 8),
              Text(
                "Sign up now and start exploring all that our \napp has to offer. We're excited to welcome\n you to our community!",
                style: Styles.textTitle14Regular.copyWith(
                  color: AppColors.greyColor,
                  height: 2,
                  letterSpacing: .2,
                ),
              ),
              const SignUpFormSection(),
              verticalSpace(height: 17),
              CustomElevatedButton(
                title: 'Create Account',
                backgroundColor: AppColors.mainBlue,
                onPressed: (){},
                // onPressed: () => checkLoginValidation(context),
              ),
              verticalSpace(height: 32),
              const TermsAndConditionsWidget(),
              verticalSpace(height: 32),
              const Center(child: DontHaveAccountWidget()),


            ],
          ),
        ),
      ),
    );
  }
}
