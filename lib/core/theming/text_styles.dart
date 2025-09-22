import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class TextStyles {
  static TextStyle textTitle24 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24.sp,
    fontFamily: 'IBMPlexSansArabic',
    color: Colors.black,
  );
  static const textTitle11 = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 11,
      fontFamily: 'IBMPlexSansArabic');
  static const textTitle12 = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      fontFamily: 'IBMPlexSansArabic');

  static const textTitle14 = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      fontFamily: 'IBMPlexSansArabic');
  static const textTitle15 = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 15,
      fontFamily: 'IBMPlexSansArabic');
  static const textTitle16 = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      fontFamily: 'IBMPlexSansArabic');

  static const textTitle18 = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      fontFamily: 'IBMPlexSansArabic');
  static const textTitle32 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 32,
    fontFamily: 'IBMPlexSansArabic',
  );
}
