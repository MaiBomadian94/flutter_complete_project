import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/font_weight.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Styles {
  static TextStyle textTitle24Bold = TextStyle(
    fontWeight: FontWeightHelper.bold,
    fontSize: 24.sp,
    fontFamily: 'Inter',
    color: Colors.black,
  );
  static TextStyle textTitle14Regular = TextStyle(
    fontWeight: FontWeightHelper.normal,
    fontSize: 14.sp,
    fontFamily: 'Inter',
    color: Colors.black,
  );
  static TextStyle textTitle14medium = TextStyle(
    fontWeight: FontWeightHelper.medium,
    fontSize: 14.sp,
    fontFamily: 'Inter',
  );

  static TextStyle textTitle12 = TextStyle(
    fontWeight: FontWeightHelper.normal,
    fontSize: 12.sp,
    fontFamily: 'Inter',
    color: Colors.black,
  );

  static TextStyle textTitle32Bold = TextStyle(
    fontWeight: FontWeightHelper.bold,
    fontSize: 32.sp,
    fontFamily: 'Inter',
  );

  static TextStyle textTitle16 = TextStyle(
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 16.sp,
    fontFamily: 'Inter',
  );
}
