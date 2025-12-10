import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/text_styles.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> context.pushNamed(Routes.signUp),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account?',
              style: Styles.textTitle14Regular,
            ),
            TextSpan(
              text: '  Sign Up',
              style: Styles.font14BlueSemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
