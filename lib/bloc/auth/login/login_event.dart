part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUserEvent extends LoginEvent {
  final String email;
  final String password;

  const LoginUserEvent({
    required this.email,
    required this.password,
  });
}

class CheckLoginUserEvent extends LoginEvent {
  late final Navigator adminRoute;
  late final Navigator studentRoute;
  late final Navigator lecturerRoute;
  late final BuildContext context;

  CheckLoginUserEvent({
    required this.adminRoute,
    required this.studentRoute,
    required this.lecturerRoute,
  });
}

class CheckRoleUserEvent extends LoginEvent {
  late final Navigator adminRoute;
  late final Navigator studentRoute;
  late final Navigator lecturerRoute;
  late final BuildContext context;

  CheckRoleUserEvent({
    required this.adminRoute,
    required this.studentRoute,
    required this.lecturerRoute,
  });
}
