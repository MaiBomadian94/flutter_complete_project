import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/features/register/presentation/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter_complete_project/features/register/presentation/sign_up_cubit/sign_up_states.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/colors.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpStates>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) => {
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
            context.pushReplacementNamed(Routes.login);
          },
          // failure: failure,
        ),
      },
      child: const SizedBox.shrink(),
    );
  }
}
