import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_project/core/theming/text_styles.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: Styles.textTitle14RegularGray,
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: Styles.textTitle14MediumBlack,
          ), 
          TextSpan(
            text: ' and',
            style: Styles.textTitle14RegularGray,
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: Styles.textTitle14MediumBlack.copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }
}
