import 'package:online_learning_app/export.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        await AuthService().registerUser(
          name: event.name,
          email: event.email,
          role: event.role,
          password: event.password,
        );
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });
    on<LoginUserEvent>((event, emit) async {
      // TODO: implement event handler
    });
  }
}
