part of 'get_video_by_course_id_and_author_id_bloc.dart';

abstract class GetVideoByCourseIdAndAuthorIdEvent extends Equatable {
  const GetVideoByCourseIdAndAuthorIdEvent();

  @override
  List<Object> get props => [];
}

class VideoByCourseIdAndAuthorIdEvent extends GetVideoByCourseIdAndAuthorIdEvent {
  final String courseId;
  const VideoByCourseIdAndAuthorIdEvent({required this.courseId});
}
