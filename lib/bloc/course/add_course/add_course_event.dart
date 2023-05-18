part of 'add_course_bloc.dart';

abstract class AddCourseEvent extends Equatable {
  const AddCourseEvent();

  @override
  List<Object> get props => [];
}

class AddNewCourseEvent extends AddCourseEvent {
  final String categoryId;
  final String memberId;
  final String transactionId;
  final String title;
  final String desc;
  final String image;
  const AddNewCourseEvent({
    required this.categoryId,
    required this.memberId,
    required this.transactionId,
    required this.title,
    required this.desc,
    required this.image,
  });
}
