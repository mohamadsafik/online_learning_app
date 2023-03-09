import 'package:online_learning_app/export.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/models/user_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUserEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        UserModel user = await AuthService().loginUser(
          email: event.email,
          password: event.password,
        );
        emit(LoginSuccess(user: user));
      } catch (e) {
        emit(LoginError(message: e.toString()));
      }
    });
  }
}
