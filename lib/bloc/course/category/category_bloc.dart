import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/data/api_services/api_services.dart';

import '../../../data/models/app/category_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<GetCategoryEvent>((event, emit) async {
      emit(CategoryLoading());
      try {
        var category = await ApiServices().getCategories();
        CategoryModel data = CategoryModel.fromJson(category);
        if (data.result == true) {
          emit(CategorySuccess(categories: data));
        } else {
          emit(CategoryError(message: data.message.toString()));
        }
      } catch (e) {
        emit(CategoryError(message: e.toString()));
      }
    });
  }
}
