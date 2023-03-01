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
  final String? message;
  const LoginError({this.message});

  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final String? message;
  const LoginSuccess({this.message});

  @override
  List<Object> get props => [];
}

class CheckLoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class CheckLoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class CheckLoginError extends LoginState {
  final String? message;
  const CheckLoginError({this.message});

  @override
  List<Object> get props => [];
}

class CheckLoginSuccess extends LoginState {
  final String? message;
  const CheckLoginSuccess({this.message});

  @override
  List<Object> get props => [];
}
