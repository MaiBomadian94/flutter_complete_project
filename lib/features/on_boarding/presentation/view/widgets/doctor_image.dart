import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/theming/text_styles.dart';

class DoctorImage extends StatelessWidget {
  const DoctorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/svgs/logo_low_opacity.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  AppColors.whiteColor,
                  AppColors.whiteColor.withOpacity(0.0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.12, 0.4]),
          ),
          child: Image.asset('assets/images/doctor_Image.png'),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 30,
          child: Text(
            textAlign: TextAlign.center,
            'Best Doctor \nAppointment App',
            style: TextStyles.textTitle32.copyWith(color: AppColors.mainBlue),
          ),
        ),
      ],
    );
  }
}
