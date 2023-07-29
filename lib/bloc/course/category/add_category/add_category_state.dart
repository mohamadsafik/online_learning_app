part of 'add_category_bloc.dart';

abstract class AddCategoryState extends Equatable {
  const AddCategoryState();

  @override
  List<Object> get props => [];
}

class AddCategoryInitial extends AddCategoryState {}

class AddCategoryLoading extends AddCategoryState {}

class AddCategorySuccess extends AddCategoryState {
  final CategoryModel data;
  const AddCategorySuccess({required this.data});
}

class AddCategoryError extends AddCategoryState {
  final String message;
  const AddCategoryError({required this.message});
}
