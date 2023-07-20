import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/data/api_services/api_services.dart';
import 'package:online_learning_app/data/models/course/course_model.dart';

part 'add_course_event.dart';
part 'add_course_state.dart';

class AddCourseBloc extends Bloc<AddCourseEvent, AddCourseState> {
  AddCourseBloc() : super(AddCourseInitial()) {
    on<AddNewCourseEvent>((event, emit) async {
      emit(AddCourseLoading());
      try {
        var json = await ApiServices().addCourse(
          categoryId: event.categoryId.toString(),
          memberId: event.memberId.toString(),
          title: event.title,
          desc: event.desc,
          image: event.image,
        );
        CourseModel data = CourseModel.fromJson(json);
        if (data.result == true) {
          emit(AddCourseSuccess(course: data, message: data.message));
        } else {
          emit(AddCourseError(message: data.message.toString()));
        }
      } catch (e) {
        emit(AddCourseError(message: e.toString()));
      }
    });
  }
}
