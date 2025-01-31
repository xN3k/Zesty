part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
  @override
  List<Object> get props => [];
}

class UsernameChanged extends SignInEvent {
  final String username;

  const UsernameChanged({required this.username});

  @override
  List<Object> get props => [username];
}

class EmailUnfocused extends SignInEvent {}

class PasswordChanged extends SignInEvent {
  final String password;

  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class PasswordUnfocused extends SignInEvent {}

class SignInRequest extends SignInEvent {}
