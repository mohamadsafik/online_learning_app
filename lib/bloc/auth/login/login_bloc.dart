import 'package:online_learning_app/data/api_services/api_services.dart';
import 'package:online_learning_app/data/models/auth/login_model.dart';
import 'package:online_learning_app/export.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUserEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        var data = await ApiServices().login(
          emailOrUsername: event.emailOrUsername,
          password: event.password,
        );
        print(data);
        if (data["result"] == true) {
          emit(LoginSuccess(user: LoginModel.fromJson(data)));
        } else {
          emit(LoginError(message: data["message"]));
        }
      } catch (e) {
        emit(LoginError(message: e.toString()));
      }
    });
  }
}
