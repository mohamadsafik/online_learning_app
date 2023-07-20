part of 'get_course_bloc.dart';

abstract class GetCourseState extends Equatable {
  const GetCourseState();

  @override
  List<Object> get props => [];
}

class GetCourseInitial extends GetCourseState {}

class GetCourseLoading extends GetCourseState {}

class GetCourseSuccess extends GetCourseState {
  final CourseModel course;
  const GetCourseSuccess({required this.course});
}

class GetCourseError extends GetCourseState {
  final String message;
  const GetCourseError({required this.message});
}
