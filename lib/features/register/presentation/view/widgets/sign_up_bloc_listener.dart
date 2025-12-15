import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/features/register/presentation/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter_complete_project/features/register/presentation/sign_up_cubit/sign_up_states.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/text_styles.dart';

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
            successState(context);          },
          failure: (error)=> errorState(context,error),
        ),
      },
      child: const SizedBox.shrink(),
    );
  }
}

void successState(BuildContext context) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title:  Text('Account created successfully',style: Styles.textTitle16semiBold,),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Welcome, Your account has been created successfully!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.blue, disabledForegroundColor: Colors.grey.withOpacity(0.38),
            ),
            onPressed: () {
              context.pushNamed(Routes.login);
            },
            child: const Text('Continue'),
          ),
        ],
      );
    },
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
