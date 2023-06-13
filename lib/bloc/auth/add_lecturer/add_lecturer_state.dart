part of 'add_lecturer_bloc.dart';

abstract class AddLecturerState extends Equatable {
  const AddLecturerState();

  @override
  List<Object> get props => [];
}

class AddLecturerInitial extends AddLecturerState {}

class AddLecturerLoading extends AddLecturerState {}

class AddLecturerSuccess extends AddLecturerState {
  final String message;

  const AddLecturerSuccess({
    required this.message,
  });

  @override
  List<Object> get props => [];
}

class AddLecturerError extends AddLecturerState {
  final String message;
  const AddLecturerError({required this.message});

  @override
  List<Object> get props => [];
}
