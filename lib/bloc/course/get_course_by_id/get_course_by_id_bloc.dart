import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/data/api_services/api_services.dart';

import '../../../data/models/course/course_model.dart';

part 'get_course_by_id_event.dart';
part 'get_course_by_id_state.dart';

class GetCourseByIdBloc extends Bloc<GetCourseByIdEvent, GetCourseByIdState> {
  GetCourseByIdBloc() : super(GetCourseByIdInitial()) {
    on<CourseByIdEvent>((event, emit) async {
      emit(GetCourseByIdLoading());
      try {
        var json = await ApiServices().getCourseById(id: event.id);
        CourseModel course = CourseModel.fromJson(json);
        if (course.result == true) {
          emit(GetCourseByIdSuccess(course: course));
        } else {
          emit(GetCourseByIdError(message: course.message.toString()));
        }
      } catch (e) {
        emit(GetCourseByIdError(message: e.toString()));
      }
    });
  }
}
