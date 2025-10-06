import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    this.isThereIcon,
    this.assetPath,
    this.iconPadding,
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
  final bool? isThereIcon;
  final String? assetPath;
  final double? iconPadding;
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
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return backgroundColor;
              }
              return backgroundColor;
            },
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 16.r),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Stack(
          // alignment: Alignment.center,
          children: [
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Styles.textTitle16.copyWith(
                  color: textColor ?? AppColors.whiteColor,
                ),
              ),
            ),
            if (isThereIcon == true)
              Align(
                alignment: Alignment.centerRight, // أو centerLeft
                child: Padding(
                  padding: EdgeInsets.only(left: iconPadding ?? 0), // متجاوبة
                  child: SvgPicture.asset(assetPath ?? "",
                      width: 20.w, height: 20.h),
                ),
              )
          ],
        ),
      ),
    );
  }
}
