part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends RegisterEvent {
  final String userName;
  final String email;
  final String password;
  final String dateBirth;
  final String gender;
  final String fullName;

  const RegisterUserEvent({
    required this.email,
    required this.password,
    required this.fullName,
    this.userName = '',
    this.gender = '',
    this.dateBirth = '',
  });
}
