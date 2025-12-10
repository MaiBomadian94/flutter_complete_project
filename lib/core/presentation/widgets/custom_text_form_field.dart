import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.isObscureText,
    required this.hintText,
    this.contentPadding,
    this.suffixIcon,
    this.focusedBorder,
    this.enabledBorder,
    this.controller,
    required this.validator,
  });

  final bool? isObscureText;
  final String hintText;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Function(String?) validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.blackColor,
      decoration: InputDecoration(
        fillColor: AppColors.formFilledColor,
        filled: true,
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 17.h, vertical: 20.w),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.mainBlue,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.lighterGrey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.errorColor, width: 1),
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.errorColor, width: 1),
          borderRadius: BorderRadius.circular(16.r),
        ),
        hintStyle: Styles.textTitle14medium.copyWith(
          color: AppColors.hintColor,
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      obscureText: isObscureText ?? false,
      style: Styles.textTitle14medium.copyWith(color: AppColors.formTextColor),
      validator: (value) => validator(value),
    );
  }
}
