import 'package:equatable/equatable.dart';
import 'package:online_learning_app/constant/storage_services.dart';
import 'package:online_learning_app/data/models/app/user_model.dart';
import 'package:online_learning_app/export.dart';

part 'check_login_event.dart';
part 'check_login_state.dart';

class CheckLoginBloc extends Bloc<CheckLoginEvent, CheckLoginState> {
  CheckLoginBloc() : super(CheckLoginInitial()) {
    on<CheckUserLoginEvent>((event, emit) async {
      try {
        emit(CheckLoginLoading());
        String? user = await storage.readData('user');
        if (user != null) {
          emit(CheckLoginSuccess(data: UserModel.deserialize(user)));
        } else {
          emit(CheckLoginError(message: ""));
        }
      } catch (e) {
        emit(CheckLoginError(message: e.toString()));
      }
    });
  }
}
