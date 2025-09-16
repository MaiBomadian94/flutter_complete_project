import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/routing/app_routes.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  const DocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: AppColors.mainBlue,
            scaffoldBackgroundColor: AppColors.whiteColor),
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: Routes.onBoarding,
      ),
    );
  }
}
