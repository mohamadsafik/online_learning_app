import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/data/api_services/api_services.dart';

import '../../../data/models/course/course_model.dart';

part 'get_course_event.dart';
part 'get_course_state.dart';

class GetCourseBloc extends Bloc<GetCourseEvent, GetCourseState> {
  GetCourseBloc() : super(GetCourseInitial()) {
    on<GetCourseEvent>((event, emit) async {
      // TODO: implement event handler
      emit(GetCourseLoading());
      try {
        var json = await ApiServices().getCourses();
        CourseModel course = CourseModel.fromJson(json);
        if (course.result == true) {
          emit(GetCourseSuccess(course: course));
        } else {
          emit(GetCourseError(message: course.message.toString()));
        }
      } catch (e) {
        emit(GetCourseError(message: e.toString()));
      }
    });
  }
}
