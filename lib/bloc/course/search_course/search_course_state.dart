part of 'search_course_bloc.dart';

abstract class SearchCourseState extends Equatable {
  const SearchCourseState();

  @override
  List<Object> get props => [];
}

class SearchCourseInitial extends SearchCourseState {}

class SearchCourseLoading extends SearchCourseState {}

class SearchCourseSuccess extends SearchCourseState {
  final SearchCourseModel result;

  const SearchCourseSuccess({required this.result});
}

class SearchCourseError extends SearchCourseState {
  final String message;

  const SearchCourseError({required this.message});
}
