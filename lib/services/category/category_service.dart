import 'package:notifriend/core/services/storage/storage_service.dart';
import 'package:notifriend/models/category/category_response.dart';
import 'package:notifriend/repositories/category/category_repository.dart';

class CategoryService {

  CategoryRepository categoryRepository;
  StorageService storageService;

   CategoryService({required this.categoryRepository, required this.storageService});

   Future<List<CategoryResponse>> getCategories() async {
     final response = await categoryRepository.getCategories();

     return response.data!;
   }
}