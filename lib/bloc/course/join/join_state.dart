part of 'join_bloc.dart';

abstract class JoinState extends Equatable {
  const JoinState();

  @override
  List<Object> get props => [];
}

class JoinInitial extends JoinState {}

class JoinLoading extends JoinState {}

class JoinSuccess extends JoinState {}

class JoinError extends JoinState {
  final String message;
  const JoinError({required this.message});
}
