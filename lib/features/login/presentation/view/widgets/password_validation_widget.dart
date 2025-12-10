import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/text_styles.dart';

class PasswordValidationWidget extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidationWidget({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationsTextRow(
          textTitle: 'At least 1 lowercase letter',
          isValid: hasLowerCase,
        ),
        verticalSpace(height: 2),
        buildValidationsTextRow(
          textTitle: 'At least 1 uppercase letter',
          isValid: hasUpperCase,
        ),
        verticalSpace(height: 2),
        buildValidationsTextRow(
          textTitle: 'At least 1 special character',
          isValid: hasSpecialCharacters,
        ),
        verticalSpace(height: 2),
        buildValidationsTextRow(
          textTitle: 'At least 8 characters length',
          isValid: hasMinLength,
        ),

        verticalSpace(height: 2),
        buildValidationsTextRow(
          textTitle: 'At least 1 number',
          isValid: hasNumber,
        ),
      ],
    );
  }
}

Row buildValidationsTextRow({
  required String textTitle,
  required bool isValid,
}) {
  return Row(
    children: [
      const CircleAvatar(radius: 2.5, backgroundColor: AppColors.greyColor),
      horizontalSpace(width: 6),
      Text(
        textTitle,
        style: Styles.font13DarkBlueRegular.copyWith(
          decoration: isValid ? TextDecoration.lineThrough : null,
          decorationColor: Colors.green,
          decorationThickness: 2,
          color: isValid ? AppColors.greyColor : AppColors.blackColor,
        ),
      ),
    ],
  );
}
