import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/sign_in/sign_in_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  const PasswordInputWidget({
    super.key,
    required FocusNode passwordNode,
  }) : _passwordNode = passwordNode;

  final FocusNode _passwordNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(),
          ),
          focusNode: _passwordNode,
          onChanged: (value) {
            context.read<SignInBloc>().add(PasswordChanged(password: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter password";
            }
            if (value.length < 6) {
              return "Please enter password more than 6 character";
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
