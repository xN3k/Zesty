import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zesty/bloc/sign_in/sign_in_bloc.dart';
import 'package:zesty/config/routes_name.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listenWhen: (previous, current) =>
          previous.postApiStatus != current.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.error) {
          log(state.message.toString());
        }
        if (state.postApiStatus == PostApiStatus.success) {
          Navigator.pushNamed(context, RoutesName.home);
          // FlushBarHelper.flushBarSuccessMessage("Login Successful", context);
        }
      },
      child: BlocBuilder<SignInBloc, SignInState>(
        buildWhen: (previous, current) =>
            previous.postApiStatus != current.postApiStatus,
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<SignInBloc>().add(SignInRequest());
              }
            },
            child: state.postApiStatus == PostApiStatus.loading
                ? const CircularProgressIndicator()
                : Text(
                    'Login',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
          );
        },
      ),
    );
  }
}
