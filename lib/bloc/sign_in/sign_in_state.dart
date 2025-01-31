part of 'sign_in_bloc.dart';

enum PostApiStatus { initial, loading, success, error }

class SignInState extends Equatable {
  final String username;
  final String password;
  final String message;
  final PostApiStatus postApiStatus;

  const SignInState({
    this.username = '',
    this.password = '',
    this.message = '',
    this.postApiStatus = PostApiStatus.initial,
  });

  SignInState copyWith({
    String? username,
    String? password,
    String? message,
    PostApiStatus? postApiStatus,
  }) {
    return SignInState(
      username: username ?? this.username,
      password: password ?? this.password,
      message: message ?? this.message,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object?> get props => [username, password, message, postApiStatus];
}
