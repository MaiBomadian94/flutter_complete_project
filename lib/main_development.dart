import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'doc_app.dart';

void main() async{

  await ScreenUtil.ensureScreenSize();

  setUpInjection();
  runApp(const DocApp());
}
