import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theming/colors.dart';
import '../../theming/text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    this.textColor,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.onPressed,
    this.width,
    this.radius,
  });

  final String title;
  final Color backgroundColor;
  final Color? textColor;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? width;
  final void Function()? onPressed;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 52.h,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 16.r),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.textTitle16semiBold.copyWith(
            color: textColor ?? AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
