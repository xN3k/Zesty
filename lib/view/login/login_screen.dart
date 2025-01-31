import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zesty/bloc/sign_in/sign_in_bloc.dart';

import '../../dependency_injection/service_locator.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final SignInBloc _loginBloc;
  final _formKey = GlobalKey<FormState>();

  final _emailNode = FocusNode();
  final _passwordNode = FocusNode();

  @override
  void initState() {
    _loginBloc = SignInBloc(userRepository: getIt());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EmailInputWidget(emailNode: _emailNode),
                const SizedBox(
                  height: 20,
                ),
                PasswordInputWidget(passwordNode: _passwordNode),
                const SizedBox(
                  height: 30,
                ),
                LoginButtonWidget(formKey: _formKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
