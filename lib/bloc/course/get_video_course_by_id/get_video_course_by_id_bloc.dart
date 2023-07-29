import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_video_course_by_id_event.dart';
part 'get_video_course_by_id_state.dart';

class GetVideoCourseByIdBloc extends Bloc<GetVideoCourseByIdEvent, GetVideoCourseByIdState> {
  GetVideoCourseByIdBloc() : super(GetVideoCourseByIdInitial()) {
    on<GetVideoCourseByIdEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
