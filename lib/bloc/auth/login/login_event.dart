part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUserEvent extends LoginEvent {
  final String emailOrUsername;
  final String password;

  const LoginUserEvent({
    required this.emailOrUsername,
    required this.password,
  });
}
