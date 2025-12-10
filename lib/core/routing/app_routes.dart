import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/features/home/presentation/view/home_view/home_view.dart';
import 'package:flutter_complete_project/features/login/presentation/login_cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/login/presentation/view/login_view.dart';
import 'package:flutter_complete_project/features/on_boarding/presentation/view/on_boarding_view.dart';

import '../di/dependency_injection.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());

      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginView(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeView());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No roure defined for ${settings.name}')),
          ),
        );
    }
  }
}
