part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUserEvent extends LoginEvent {
  final String emailOrPassword;
  final String password;

  const LoginUserEvent({
    required this.emailOrPassword,
    required this.password,
  });
}
