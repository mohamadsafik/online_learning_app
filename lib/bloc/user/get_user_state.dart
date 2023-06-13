part of 'get_user_bloc.dart';

abstract class GetUserState extends Equatable {
  const GetUserState();

  @override
  List<Object> get props => [];
}

class GetUserInitial extends GetUserState {}

class GetUserLoading extends GetUserState {}

class GetUserSuccess extends GetUserState {
  final UserModel user;
  final String message;
  const GetUserSuccess({required this.user, this.message = ''});
}

class GetUserError extends GetUserState {
  final String message;
  const GetUserError({required this.message});
}
