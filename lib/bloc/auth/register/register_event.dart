part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends RegisterEvent {
  final String name;
  final String email;
  final String role;
  final String password;

  const RegisterUserEvent({
    required this.name,
    required this.email,
    required this.role,
    required this.password,
  });
}
