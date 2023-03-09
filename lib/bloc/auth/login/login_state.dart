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

class CheckRoleInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class CheckRoleLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class CheckRoleError extends LoginState {
  final String? message;
  const CheckRoleError({this.message});

  @override
  List<Object> get props => [];
}

class CheckRoleSuccess extends LoginState {
  final String? message;
  final dynamic data;
  const CheckRoleSuccess({
    this.message,
    required this.data,
  });

  @override
  List<Object> get props => [];
}
