part of 'get_course_by_id_bloc.dart';

abstract class GetCourseByIdEvent extends Equatable {
  const GetCourseByIdEvent();

  @override
  List<Object> get props => [];
}

class CourseByIdEvent extends GetCourseByIdEvent {
  final String id;
  const CourseByIdEvent({required this.id});
}
