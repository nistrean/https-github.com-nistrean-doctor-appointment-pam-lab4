import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/category_model.dart';
import '../../domain/repositories/category_repository.dart';

abstract class CategoryEvent {}

class LoadCategoryEvent extends CategoryEvent {}

class CategoryState {
  final List<CategoryModel> categories;
  CategoryState(this.categories);
}

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository repository;

  CategoryBloc(this.repository) : super(CategoryState([])) {
    on<LoadCategoryEvent>((event, emit) async {
      final categories = await repository.fetchCategories();
      emit(CategoryState(categories));
    });
  }
}
