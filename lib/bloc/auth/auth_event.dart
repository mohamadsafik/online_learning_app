part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginUserEvent extends AuthEvent {}

class RegisterUserEvent extends AuthEvent {
  final String name;
  final String email;
  final String role;
  final String password;
  RegisterUserEvent({
    required this.name,
    required this.email,
    required this.role,
    required this.password,
  });
}
