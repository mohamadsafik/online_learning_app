part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginError extends LoginState {
  final String message;
  const LoginError({required this.message});

  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final UserModel user;
  final String? message;
  const LoginSuccess({
    required this.user,
    this.message,
  });

  @override
  List<Object> get props => [message.toString()];
}
