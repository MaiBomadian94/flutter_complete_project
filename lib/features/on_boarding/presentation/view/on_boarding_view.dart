import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/features/on_boarding/presentation/view/widgets/doctor_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/presentation/widgets/custom_elevated_button.dart';
import '../../../../core/theming/text_styles.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
            bottom: 30.h,
          ),
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
                    'Docdoc',
                    style: TextStyles.textTitle24,
                  )

                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              const DoctorImage(),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w),
                child: Text(
                  'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                  textAlign: TextAlign.center,
                  style: TextStyles.textTitle12
                      .copyWith(color: AppColors.greyColor),
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: CustomElevatedButton(
                  onPressed: () {},
                  title: 'Get Started',
                  backgroundColor: AppColors.mainBlue,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
