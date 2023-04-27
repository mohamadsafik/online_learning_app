import 'package:equatable/equatable.dart';

class CourseModel extends Equatable {
  final String uid;
  final String uidAuthor;
  final String title;
  final String description;
  final String category;
  final String authorName;

  const CourseModel({
    required this.uidAuthor,
    required this.title,
    required this.description,
    required this.category,
    required this.authorName,
    required this.uid,
  });

  @override
  List<Object?> get props => [
        uid,
        uidAuthor,
        title,
        description,
        category,
        authorName,
      ];
}
