part of 'get_course_by_id_bloc.dart';

abstract class GetCourseByIdState extends Equatable {
  const GetCourseByIdState();

  @override
  List<Object> get props => [];
}

class GetCourseByIdInitial extends GetCourseByIdState {}

class GetCourseByIdLoading extends GetCourseByIdState {}

class GetCourseByIdSuccess extends GetCourseByIdState {
  final CourseModel course;
  const GetCourseByIdSuccess({required this.course});
}

class GetCourseByIdError extends GetCourseByIdState {
  final String message;
  GetCourseByIdError({required this.message});
}
