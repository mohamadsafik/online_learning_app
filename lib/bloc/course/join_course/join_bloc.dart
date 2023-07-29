import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/data/api_services/api_services.dart';
import 'package:online_learning_app/data/models/course/join_course.dart';

part 'join_event.dart';
part 'join_state.dart';

class JoinBloc extends Bloc<JoinEvent, JoinState> {
  JoinBloc() : super(JoinInitial()) {
    on<JoinCourseEvent>((event, emit) async {
      emit(JoinLoading());
      try {
        var json = await ApiServices().joinCourse(
          courseId: event.courseId,
          joinedAt: event.joinedAt,
        );
        JoinCourseModel join = JoinCourseModel.fromJson(json);
        if (join.result == true) {
          emit(JoinSuccess());
        } else {
          emit(JoinError(message: join.message.toString()));
        }
      } catch (e) {
        emit(JoinError(message: e.toString()));
      }
    });
  }
}
