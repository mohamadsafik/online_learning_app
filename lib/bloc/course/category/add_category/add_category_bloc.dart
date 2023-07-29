import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/data/api_services/api_services.dart';
import 'package:online_learning_app/data/models/app/category_model.dart';

part 'add_category_event.dart';
part 'add_category_state.dart';

class AddCategoryBloc extends Bloc<AddCategoryEvent, AddCategoryState> {
  AddCategoryBloc() : super(AddCategoryInitial()) {
    on<AddNewCategoryEvent>((event, emit) async {
      emit(AddCategoryLoading());
      try {
        var json = await ApiServices().addCategory(name: event.name);
        CategoryModel data = CategoryModel.fromJson(json);
        if (data.result == true) {
          emit(AddCategorySuccess(data: data));
        } else {
          emit(AddCategoryError(message: data.message.toString()));
        }
      } catch (e) {
        emit(AddCategoryError(message: e.toString()));
      }
    });
  }
}
