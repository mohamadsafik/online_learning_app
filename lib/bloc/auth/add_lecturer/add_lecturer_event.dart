part of 'add_lecturer_bloc.dart';

abstract class AddLecturerEvent extends Equatable {
  const AddLecturerEvent();

  @override
  List<Object> get props => [];
}

class AddNewLecturerEvent extends AddLecturerEvent {
  final String userName;
  final String email;
  final String password;
  final String dateBirth;
  final String gender;
  final String fullName;

  const AddNewLecturerEvent({
    required this.email,
    required this.password,
    required this.fullName,
    this.userName = '',
    this.gender = '',
    this.dateBirth = '',
  });
}
