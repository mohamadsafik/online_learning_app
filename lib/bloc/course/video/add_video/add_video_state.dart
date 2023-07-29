part of 'add_video_bloc.dart';

abstract class AddVideoState extends Equatable {
  const AddVideoState();

  @override
  List<Object> get props => [];
}

class AddVideoInitial extends AddVideoState {}

class AddVideoLoading extends AddVideoState {}

class AddVideoSuccess extends AddVideoState {
  final AddVideoModel video;
  const AddVideoSuccess({required this.video});
}

class AddVideoError extends AddVideoState {
  final String message;
  const AddVideoError({required this.message});
}
