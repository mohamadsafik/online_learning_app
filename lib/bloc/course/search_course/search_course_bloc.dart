import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/data/models/course/search_course_model.dart';

import '../../../data/api_services/api_services.dart';
import '../../../data/models/course/course_model.dart';

part 'search_course_event.dart';
part 'search_course_state.dart';

class SearchCourseBloc extends Bloc<SearchCourseEvent, SearchCourseState> {
  SearchCourseBloc() : super(SearchCourseInitial()) {
    on<SearchCourseByQuery>((event, emit) async {
      final String querySearch = event.query.trim();
      if (querySearch.isNotEmpty) {
        emit(SearchCourseLoading());
        try {
          var json = await ApiServices().searchCourse(query: event.query);
          SearchCourseModel data = SearchCourseModel.fromJson(json);
          if (data.result == true) {
            emit(SearchCourseSuccess(result: data));
          } else {
            emit(SearchCourseError(message: data.message.toString()));
          }
        } catch (e) {
          emit(SearchCourseError(message: e.toString()));
        }
      }
    });
  }
}
