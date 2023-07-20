part of 'add_course_bloc.dart';

abstract class AddCourseEvent extends Equatable {
  const AddCourseEvent();

  @override
  List<Object> get props => [];
}

class AddNewCourseEvent extends AddCourseEvent {
  final int? categoryId;
  final String title;
  final String desc;
  final String image;
  final String memberId;
  const AddNewCourseEvent({
    required this.categoryId,
    required this.title,
    required this.desc,
    this.image = '',
    this.memberId = '',
  });
}
