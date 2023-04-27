import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<LogoutUserEvent>((event, emit) async {
      try {
        emit(LogoutLoading());

        emit(LogoutSuccess(message: event.message));
      } catch (e) {
        emit(LogoutError(message: e.toString()));
      }
    });
  }
}
