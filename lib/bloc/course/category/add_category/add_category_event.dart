part of 'add_category_bloc.dart';

abstract class AddCategoryEvent extends Equatable {
  const AddCategoryEvent();

  @override
  List<Object> get props => [];
}

class AddNewCategoryEvent extends AddCategoryEvent {
  final String name;
  const AddNewCategoryEvent({required this.name});
}
