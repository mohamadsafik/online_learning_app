part of 'delete_video_bloc.dart';

abstract class DeleteVideoState extends Equatable {
  const DeleteVideoState();

  @override
  List<Object> get props => [];
}

class DeleteVideoInitial extends DeleteVideoState {}

class DeleteVideoLoading extends DeleteVideoState {}

class DeleteVideoSuccess extends DeleteVideoState {
  final String message;
  const DeleteVideoSuccess({required this.message});
}

class DeleteVideoError extends DeleteVideoState {
  final String message;
  const DeleteVideoError({required this.message});
}
