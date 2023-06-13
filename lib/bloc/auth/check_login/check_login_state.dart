part of 'check_login_bloc.dart';

abstract class CheckLoginState extends Equatable {
  const CheckLoginState();

  @override
  List<Object> get props => [];
}

class CheckLoginInitial extends CheckLoginState {
  @override
  List<Object> get props => [];
}

class CheckLoginLoading extends CheckLoginState {
  @override
  List<Object> get props => [];
}

class CheckLoginSuccess extends CheckLoginState {
  final UserModelStorage data;
  const CheckLoginSuccess({required this.data});
}

class CheckLoginError extends CheckLoginState {
  final String message;
  CheckLoginError({required this.message});
  @override
  List<Object> get props => [message];
}
