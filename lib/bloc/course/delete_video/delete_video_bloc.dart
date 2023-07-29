import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/data/api_services/api_services.dart';

import '../../../../data/models/course/delete_model.dart';

part 'delete_video_event.dart';
part 'delete_video_state.dart';

class DeleteVideoBloc extends Bloc<DeleteVideoEvent, DeleteVideoState> {
  DeleteVideoBloc() : super(DeleteVideoInitial()) {
    on<DeleteVideoFromCourseEvent>((event, emit) async {
      emit(DeleteVideoLoading());
      try {
        var json = await ApiServices().deleteVideo(id: event.id);
        DeleteModel data = DeleteModel.fromJson(json);
        if (data.result == true) {
          emit(DeleteVideoSuccess(message: data.message.toString()));
        } else {
          emit(DeleteVideoError(message: data.message.toString()));
        }
      } catch (e) {
        emit(DeleteVideoError(message: e.toString()));
      }
    });
  }
}
