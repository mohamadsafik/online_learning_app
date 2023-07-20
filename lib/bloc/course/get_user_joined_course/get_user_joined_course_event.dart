part of 'get_user_joined_course_bloc.dart';

abstract class GetUserJoinedCourseEvent extends Equatable {
  const GetUserJoinedCourseEvent();

  @override
  List<Object> get props => [];
}

class UserJoinedCourseEvent extends GetUserJoinedCourseEvent {
  final String userId;
  const UserJoinedCourseEvent({required this.userId});
}
