part of 'logout_bloc.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

class LogoutInitial extends LogoutState {
  @override
  List<Object> get props => [];
}

class LogoutLoading extends LogoutState {
  @override
  List<Object> get props => [];
}

class LogoutSuccess extends LogoutState {
  final String message;
  const LogoutSuccess({required this.message});

  @override
  List<Object> get props => [];
}

class LogoutError extends LogoutState {
  final String message;
  const LogoutError({required this.message});

  @override
  List<Object> get props => [];
}
