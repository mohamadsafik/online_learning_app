part of 'get_user_joined_course_bloc.dart';

abstract class GetUserJoinedCourseState extends Equatable {
  const GetUserJoinedCourseState();

  @override
  List<Object> get props => [];
}

class GetUserJoinedCourseInitial extends GetUserJoinedCourseState {}

class GetUserJoinedCourseLoading extends GetUserJoinedCourseState {}

class GetUserJoinedCourseSuccess extends GetUserJoinedCourseState {
  final JoinedCourseModel joinedCourse;
  const GetUserJoinedCourseSuccess({required this.joinedCourse});
}

class GetUserJoinedCourseError extends GetUserJoinedCourseState {
  final String message;
  const GetUserJoinedCourseError({required this.message});
}
