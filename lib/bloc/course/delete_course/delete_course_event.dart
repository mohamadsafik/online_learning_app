part of 'delete_course_bloc.dart';

abstract class DeleteCourseEvent extends Equatable {
  const DeleteCourseEvent();

  @override
  List<Object> get props => [];
}

class DeleteCourseByIdEvent extends DeleteCourseEvent {
  final String id;
  const DeleteCourseByIdEvent({required this.id});
}
