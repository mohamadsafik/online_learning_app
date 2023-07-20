import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/data/api_services/api_services.dart';
import 'package:online_learning_app/data/models/user/user_model.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  GetUserBloc() : super(GetUserInitial()) {
    on<GetAllUserEvent>((event, emit) async {
      emit(GetUserLoading());
      try {
        var data = await ApiServices().getUser();
        UserModel user = UserModel.fromJson(data);
        print(user);
        if (user.result == true) {
          emit(GetUserSuccess(message: user.message!, user: user));
        } else {
          emit(GetUserError(message: user.message!));
        }
      } catch (e) {
        emit(GetUserError(message: e.toString()));
      }
    });
  }
}
