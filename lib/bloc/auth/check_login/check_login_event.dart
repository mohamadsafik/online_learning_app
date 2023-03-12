part of 'check_login_bloc.dart';

abstract class CheckLoginEvent extends Equatable {
  const CheckLoginEvent();

  @override
  List<Object> get props => [];
}

class CheckUserLoginEvent extends CheckLoginEvent {
  @override
  List<Object> get props => [];
}
