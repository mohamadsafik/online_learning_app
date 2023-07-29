import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/data/api_services/api_services.dart';
import 'package:online_learning_app/data/models/course/delete_model.dart';

part 'delete_course_event.dart';
part 'delete_course_state.dart';

class DeleteCourseBloc extends Bloc<DeleteCourseEvent, DeleteCourseState> {
  DeleteCourseBloc() : super(DeleteCourseInitial()) {
    on<DeleteCourseByIdEvent>((event, emit) async {
      emit(DeleteCourseLoading());
      try {
        var json = await ApiServices().deleteCourse(id: event.id);
        DeleteModel data = DeleteModel.fromJson(json);
        if (data.result == true) {
          emit(DeleteCourseSuccess(message: data.message.toString()));
        } else {
          emit(DeleteCourseError(message: data.message.toString()));
        }
      } catch (e) {
        emit(DeleteCourseError(message: e.toString()));
      }
    });
  }
}
