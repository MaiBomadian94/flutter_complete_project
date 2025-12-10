import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/features/login/presentation/login_cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/login/presentation/login_cubit/login_states.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/text_styles.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColors.mainBlue),
              ),
            );
          },
          success: (response) {
            context.pop();
            context.pushReplacementNamed(Routes.home);
          },
          failure: (failure) {
            errorState(context, failure);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void errorState(BuildContext context, String failure) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: AppColors.errorColor, size: 32),
        content: Center(child: Text(failure, style: Styles.textTitle14medium)),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text('Got it', style: Styles.textTitle14medium),
          ),
        ],
      ),
    );
  }
}
