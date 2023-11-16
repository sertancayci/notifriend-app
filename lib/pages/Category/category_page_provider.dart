import 'package:notifriend/core/helpers/app_services_with.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/models/category/category_response.dart';

class CategoryNotifier extends StateNotifier<CategoryState> with AppServices {
  CategoryNotifier() : super(CategoryState());

  fetchCategories() async {
    final List<CategoryResponse> categoryList =
    await categoryService.getCategories();

    state = state.copyWith(categories: categoryList);
  }

  Future<void> init() async {
    state = state.copyWith(isLoading: true);
    await fetchCategories();
    state = state.copyWith(isLoading: false);
  }

}

class CategoryState {
  CategoryState({this.categories, this.isLoading});

  final List<CategoryResponse>? categories;
  final bool? isLoading;

  CategoryState copyWith(
      {List<CategoryResponse>? categories,bool? isLoading,}) {
    return CategoryState(
      categories: categories,
    );
  }

}
