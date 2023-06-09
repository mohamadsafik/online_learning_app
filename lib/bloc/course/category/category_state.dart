part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final CategoryModel categories;
  final String message;

  const CategorySuccess({required this.categories, this.message = ''});

  @override
  List<Object> get props => [categories];
}

class CategoryError extends CategoryState {
  final String message;
  const CategoryError({required this.message});

  @override
  List<Object> get props => [message];
}
