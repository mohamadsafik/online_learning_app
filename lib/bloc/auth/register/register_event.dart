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
    required this.userName,
    required this.email,
    required this.password,
    required this.dateBirth,
    required this.gender,
    required this.fullName,
  });
}
