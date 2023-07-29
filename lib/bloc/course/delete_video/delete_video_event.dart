part of 'delete_video_bloc.dart';

abstract class DeleteVideoEvent extends Equatable {
  const DeleteVideoEvent();

  @override
  List<Object> get props => [];
}

class DeleteVideoFromCourseEvent extends DeleteVideoEvent {
  final String id;
  const DeleteVideoFromCourseEvent({required this.id});
}
