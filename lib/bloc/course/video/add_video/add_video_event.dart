part of 'add_video_bloc.dart';

abstract class AddVideoEvent extends Equatable {
  const AddVideoEvent();

  @override
  List<Object> get props => [];
}

class AddVideoCourseEvent extends AddVideoEvent {
  final String courseId;
  final String authorId;
  final String videoUrl;
  final String title;
  const AddVideoCourseEvent({
    required this.videoUrl,
    required this.courseId,
    required this.authorId,
    required this.title,
  });
}
