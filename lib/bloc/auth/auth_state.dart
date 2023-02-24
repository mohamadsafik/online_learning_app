part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSuccess extends AuthState {
  final String? message;
  AuthSuccess({this.message});

  @override
  List<Object?> get props => [];
}

class AuthError extends AuthState {
  final String? message;

  AuthError({this.message});

  @override
  List<Object?> get props => [];
}
