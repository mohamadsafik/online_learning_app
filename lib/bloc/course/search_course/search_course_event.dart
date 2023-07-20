part of 'search_course_bloc.dart';

abstract class SearchCourseEvent extends Equatable {
  const SearchCourseEvent();

  @override
  List<Object> get props => [];
}

class SearchCourseByQuery extends SearchCourseEvent {
  final String query;
  const SearchCourseByQuery({required this.query});
}
