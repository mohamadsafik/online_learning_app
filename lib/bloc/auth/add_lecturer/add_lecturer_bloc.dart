import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/api_services/api_services.dart';

part 'add_lecturer_event.dart';
part 'add_lecturer_state.dart';

class AddLecturerBloc extends Bloc<AddLecturerEvent, AddLecturerState> {
  AddLecturerBloc() : super(AddLecturerInitial()) {
    on<AddNewLecturerEvent>((event, emit) async {
      emit(AddLecturerLoading());
      try {
        var data = await ApiServices().registerLecturer(
          userName: event.userName,
          email: event.email,
          password: event.password,
          dateBirth: event.dateBirth,
          gender: event.gender,
          fullName: event.fullName,
        );
        print(data);
        if (data["result"] == true) {
          emit(AddLecturerSuccess(message: data["message"]));
        } else {
          emit(AddLecturerError(message: data["message"]));
        }
      } catch (e) {
        emit(const AddLecturerError(message: "INTERNAL SERVER ERROR"));
      }
    });
  }
}
