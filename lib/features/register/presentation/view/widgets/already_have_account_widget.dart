import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/text_styles.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> context.pushNamed(Routes.login),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account?',
              style: Styles.textTitle14Regular,
            ),
            TextSpan(
              text: '  Log In',
              style: Styles.font14BlueSemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
