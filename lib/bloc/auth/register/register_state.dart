part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterError extends RegisterState {
  final String? message;
  const RegisterError({this.message});

  @override
  List<Object> get props => [];
}

class RegisterSuccess extends RegisterState {
  final String? message;
  const RegisterSuccess({this.message});

  @override
  List<Object> get props => [];
}
