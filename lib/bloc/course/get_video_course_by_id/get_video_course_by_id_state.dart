part of 'get_video_course_by_id_bloc.dart';

abstract class GetVideoCourseByIdState extends Equatable {
  const GetVideoCourseByIdState();

  @override
  List<Object> get props => [];
}

class GetVideoCourseByIdInitial extends GetVideoCourseByIdState {}

class GetVideoCourseByIdLoading extends GetVideoCourseByIdState {}

class GetVideoCourseByIdSuccess extends GetVideoCourseByIdState {}

class GetVideoCourseByIdError extends GetVideoCourseByIdState {}
// sadas