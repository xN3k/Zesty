import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:zesty/repository/user/user_repo.dart';
part 'Sign_In_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepo userRepository;
  SignInBloc({
    required this.userRepository,
  }) : super(const SignInState()) {
    on<UsernameChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SignInRequest>(_onLoginApi);
  }

  void _onEmailChanged(UsernameChanged event, Emitter<SignInState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginApi(SignInRequest event, Emitter<SignInState> emit) async {
    Map<String, String> data = {
      'username': state.username,
      'password': state.password,
    };

    emit(state.copyWith(
      postApiStatus: PostApiStatus.loading,
      message: "submitting",
    ));

    await userRepository.signIn(data).then(
      (value) async {
        if (value.message.isNotEmpty) {
          emit(state.copyWith(
            message: value.message.toString(),
            postApiStatus: PostApiStatus.error,
          ));
        } else {
          // await SessionController().saveUserInPreference(value);
          // await SessionController().getUserFromPreference();
          emit(state.copyWith(
            message: "Login Successful",
            postApiStatus: PostApiStatus.success,
          ));
        }
      },
    ).onError(
      (error, stackTrace) {
        emit(state.copyWith(
          message: error.toString(),
          postApiStatus: PostApiStatus.error,
        ));
      },
    );
  }
}
