import 'package:equatable/equatable.dart';
import 'package:online_learning_app/export.dart';

part 'check_login_event.dart';
part 'check_login_state.dart';

class CheckLoginBloc extends Bloc<CheckLoginEvent, CheckLoginState> {
  CheckLoginBloc() : super(CheckLoginInitial()) {
    on<CheckUserLoginEvent>((event, emit) async {
      try {
        emit(CheckLoginLoading());
        UserModel user = await AuthService().checkLoginUser();
        emit(CheckLoginSuccess(user: user));
      } catch (e) {
        emit(CheckLoginError(message: e.toString()));
      }
    });
  }
}
