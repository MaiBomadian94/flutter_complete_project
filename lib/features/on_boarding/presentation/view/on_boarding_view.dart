import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theming/text_styles.dart';
import '../widgets/doctor_image.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 30.h,bottom: 30.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svgs/docdoc.svg'),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'DocDoc',
                  style: TextStyles.textTitle24,
                )
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            DoctorImage(),
          ],
        ),
      )),
    );
  }
}
