import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/data/models/course/add_video_model.dart';

import '../../../../data/api_services/api_services.dart';

part 'add_video_event.dart';
part 'add_video_state.dart';

class AddVideoBloc extends Bloc<AddVideoEvent, AddVideoState> {
  AddVideoBloc() : super(AddVideoInitial()) {
    on<AddVideoCourseEvent>((event, emit) async {
      emit(AddVideoLoading());
      try {
        var json = await ApiServices().addVideo(
          title: event.title,
          courseId: event.courseId,
          authorId: event.authorId,
          videoUrl: event.videoUrl,
        );
        AddVideoModel data = AddVideoModel.fromJson(json);
        if (data.result == true) {
          emit(AddVideoSuccess(video: data));
        } else {
          emit(AddVideoError(message: data.message.toString()));
        }
      } catch (e) {
        emit(AddVideoError(message: e.toString()));
      }
    });
  }
}
