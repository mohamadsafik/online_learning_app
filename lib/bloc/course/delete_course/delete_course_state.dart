part of 'delete_course_bloc.dart';

abstract class DeleteCourseState extends Equatable {
  const DeleteCourseState();

  @override
  List<Object> get props => [];
}

class DeleteCourseInitial extends DeleteCourseState {}

class DeleteCourseLoading extends DeleteCourseState {}

class DeleteCourseSuccess extends DeleteCourseState {
  final String message;
  const DeleteCourseSuccess({required this.message});
}

class DeleteCourseError extends DeleteCourseState {
  final String message;
  const DeleteCourseError({required this.message});
}
