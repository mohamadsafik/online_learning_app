import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/services/auth_services.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      try {
        emit(RegisterLoading());
        await AuthService().registerUser(
          name: event.name,
          email: event.email,
          role: event.role,
          password: event.password,
          createdAt: event.createdAt,
        );
        emit(const RegisterSuccess());
      } catch (e) {
        emit(const RegisterError());
      }
    });
  }
}
