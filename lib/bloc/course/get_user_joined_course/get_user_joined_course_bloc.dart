import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/data/api_services/api_services.dart';

import '../../../data/models/course/joined_course_model.dart';

part 'get_user_joined_course_event.dart';
part 'get_user_joined_course_state.dart';

class GetUserJoinedCourseBloc extends Bloc<GetUserJoinedCourseEvent, GetUserJoinedCourseState> {
  GetUserJoinedCourseBloc() : super(GetUserJoinedCourseInitial()) {
    on<UserJoinedCourseEvent>((event, emit) async {
      emit(GetUserJoinedCourseLoading());
      try {
        var json = await ApiServices().getUserJoinedCourse(id: event.userId);
        JoinedCourseModel data = JoinedCourseModel.fromJson(json);
        if (data.result == true) {
          emit(GetUserJoinedCourseSuccess(joinedCourse: data));
        } else {
          emit(GetUserJoinedCourseError(message: data.message.toString()));
        }
      } catch (e) {
        emit(GetUserJoinedCourseError(message: e.toString()));
      }
    });
  }
}
