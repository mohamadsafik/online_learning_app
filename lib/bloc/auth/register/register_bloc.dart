import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/data/api_services/api_services.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        var data = await ApiServices().register(
          userName: event.userName,
          role: event.role,
          email: event.email,
          password: event.password,
          dateBirth: event.dateBirth,
          gender: event.gender,
          fullName: event.fullName,
        );
        print(data);
        if (data["result"] == true) {
          emit(RegisterSuccess(message: data["message"]));
        } else {
          emit(RegisterError(message: data["message"]));
        }
      } catch (e) {
        emit(RegisterError(message: e.toString()));
      }
    });
  }
}
