import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
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

            ],
          ),
        ),
      ),
    );
  }
}
