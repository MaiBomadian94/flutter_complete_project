import 'package:flutter/cupertino.dart';

import '../../../../core/theming/text_styles.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
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
    );
  }
}
