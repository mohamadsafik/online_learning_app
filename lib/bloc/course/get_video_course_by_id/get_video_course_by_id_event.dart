part of 'get_video_course_by_id_bloc.dart';

abstract class GetVideoCourseByIdEvent extends Equatable {
  const GetVideoCourseByIdEvent();

  @override
  List<Object> get props => [];
}

class VideoCourseByIdEvent extends GetVideoCourseByIdEvent {
  final String id;

  const VideoCourseByIdEvent({required this.id});
}
