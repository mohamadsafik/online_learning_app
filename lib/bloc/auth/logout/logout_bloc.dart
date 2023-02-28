import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/services/auth_services.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<LogoutEvent>((event, emit) async {
      try {
        emit(LogoutLoading());
        await AuthService().logout();
        emit(const LogoutSuccess());
      } catch (e) {
        emit(LogoutError(message: e.toString()));
      }
    });
  }
}
