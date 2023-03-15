part of 'add_course_bloc.dart';

abstract class AddCourseState extends Equatable {
  const AddCourseState();

  @override
  List<Object> get props => [];
}

class AddCourseInitial extends AddCourseState {
  @override
  List<Object> get props => [];
}

class AddCourseLoading extends AddCourseState {
  @override
  List<Object> get props => [];
}

class AddCourseSuccess extends AddCourseState {
  final CourseModel course;
  final String? message;
  const AddCourseSuccess({required this.course, this.message});

  @override
  List<Object> get props => [course];
}

class AddCourseError extends AddCourseState {
  final String message;
  const AddCourseError({required this.message});

  @override
  List<Object> get props => [message];
}
