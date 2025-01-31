import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zesty/bloc/sign_in/sign_in_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  const EmailInputWidget({
    super.key,
    required FocusNode emailNode,
  }) : _emailNode = emailNode;

  final FocusNode _emailNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder(),
          ),
          focusNode: _emailNode,
          onChanged: (value) {
            context.read<SignInBloc>().add(UsernameChanged(username: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter an email address";
            }
            // if (!Validations.emailValidator(value)) {
            //   return "Please enter correct email address";
            // }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
