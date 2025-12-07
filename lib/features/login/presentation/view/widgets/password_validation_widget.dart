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
        buildValidationTextRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(height: 2),
        buildValidationTextRow('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(height: 2),
        buildValidationTextRow(
          'At least 1 special character',
          hasSpecialCharacters,
        ),
        verticalSpace(height: 2),
        buildValidationTextRow('At least 8 characters length', hasMinLength),

        verticalSpace(height: 2),
        buildValidationTextRow('At least 1 number', hasNumber),
      ],
    );
  }
}

Widget buildValidationTextRow(String text, bool isValidated) {
  return Row(
    children: [
      const CircleAvatar(radius: 2.5, backgroundColor: AppColors.greyColor),
      horizontalSpace(width: 6),
      Text(
        text,
        style: Styles.font13DarkBlueRegular.copyWith(
          decoration: isValidated ? TextDecoration.lineThrough : null,
          decorationColor: Colors.green,
          decorationThickness: 2,
          color: isValidated ? AppColors.greyColor : AppColors.blackColor,
        ),
      ),
    ],
  );
}
