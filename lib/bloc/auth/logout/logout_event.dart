part of 'logout_bloc.dart';

abstract class LogoutEvent extends Equatable {
  const LogoutEvent();

  @override
  List<Object> get props => [];
}

class LogoutUserEvent extends LogoutEvent {
  String message;
  LogoutUserEvent(this.message);
  @override
  List<Object> get props => [message];
}
