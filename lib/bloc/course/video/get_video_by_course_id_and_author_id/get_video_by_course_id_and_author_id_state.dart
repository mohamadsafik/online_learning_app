part of 'get_video_by_course_id_and_author_id_bloc.dart';

abstract class GetVideoByCourseIdAndAuthorIdState extends Equatable {
  const GetVideoByCourseIdAndAuthorIdState();

  @override
  List<Object> get props => [];
}

class GetVideoByCourseIdAndAuthorIdInitial extends GetVideoByCourseIdAndAuthorIdState {}

class GetVideoByCourseIdAndAuthorIdLoading extends GetVideoByCourseIdAndAuthorIdState {}

class GetVideoByCourseIdAndAuthorIdSuccess extends GetVideoByCourseIdAndAuthorIdState {
  final GetVideoByCourseIdAndAuthorIdModel video;
  const GetVideoByCourseIdAndAuthorIdSuccess({required this.video});
}

class GetVideoByCourseIdAndAuthorIdError extends GetVideoByCourseIdAndAuthorIdState {
  final String message;
  const GetVideoByCourseIdAndAuthorIdError({required this.message});
}
