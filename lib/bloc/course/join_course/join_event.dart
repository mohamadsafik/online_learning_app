part of 'join_bloc.dart';

abstract class JoinEvent extends Equatable {
  const JoinEvent();

  @override
  List<Object> get props => [];
}

class JoinCourseEvent extends JoinEvent {
  final String courseId;
  final String joinedAt;

  const JoinCourseEvent({
    required this.courseId,
    required this.joinedAt,
  });
}
