part of 'add_course_bloc.dart';

abstract class AddCourseEvent extends Equatable {
  const AddCourseEvent();

  @override
  List<Object> get props => [];
}

class AddNewCourseEvent extends AddCourseEvent {
  final String title;
  final String description;
  final String category;

  const AddNewCourseEvent({
    required this.title,
    required this.description,
    required this.category,
  });
}
