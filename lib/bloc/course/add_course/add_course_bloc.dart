import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/data/models/course_model.dart';

part 'add_course_event.dart';
part 'add_course_state.dart';

class AddCourseBloc extends Bloc<AddCourseEvent, AddCourseState> {
  AddCourseBloc() : super(AddCourseInitial()) {
    on<AddNewCourseEvent>((event, emit) async {
      try {
        emit(AddCourseLoading());

        // emit(AddCourseSuccess(course: course));
      } catch (e) {
        emit(AddCourseError(message: e.toString()));
      }
    });
  }
}
