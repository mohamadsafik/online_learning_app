import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/data/api_services/api_services.dart';

import '../../../../data/models/course/video_by_course_id_and_author_id_model.dart';

part 'get_video_by_course_id_and_author_id_event.dart';
part 'get_video_by_course_id_and_author_id_state.dart';

class GetVideoByCourseIdAndAuthorIdBloc extends Bloc<GetVideoByCourseIdAndAuthorIdEvent, GetVideoByCourseIdAndAuthorIdState> {
  GetVideoByCourseIdAndAuthorIdBloc() : super(GetVideoByCourseIdAndAuthorIdInitial()) {
    on<VideoByCourseIdAndAuthorIdEvent>((event, emit) async {
      // TODO: implement event handler
      emit(GetVideoByCourseIdAndAuthorIdLoading());
      try {
        var json = await ApiServices().getVideoByCourseIdAndAuthorId(id: event.courseId);
        GetVideoByCourseIdAndAuthorIdModel data = GetVideoByCourseIdAndAuthorIdModel.fromJson(json);
        if (data.result == true) {
          emit(GetVideoByCourseIdAndAuthorIdSuccess(video: data));
        } else {
          emit(GetVideoByCourseIdAndAuthorIdError(message: data.message.toString()));
        }
      } catch (e) {
        emit(GetVideoByCourseIdAndAuthorIdError(message: e.toString()));
      }
    });
  }
}
