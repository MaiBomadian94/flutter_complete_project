import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/presentation/widgets/custom_text_form_field.dart';

class SignUpFormSection extends StatefulWidget {
  const SignUpFormSection({super.key});

  @override
  State<SignUpFormSection> createState() => _SignUpFormSectionState();
}

class _SignUpFormSectionState extends State<SignUpFormSection> {

  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(child: Column(children: [              CustomTextFormField(
      hintText: 'Email',
      validator: (String? p1) {},
    ),
      verticalSpace(height: 16),
      CustomTextFormField(
        hintText: 'Password',
        validator: (String? p1) {},
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

      ),
      verticalSpace(height: 32),]));
  }
}
