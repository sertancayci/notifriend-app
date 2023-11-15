import 'package:notifriend/core/rest_client.dart';
import 'package:notifriend/models/category/category_response.dart';
import 'package:notifriend/services/base/base_list_response.dart';

class CategoryRepository {
  CategoryRepository({required this.client});

  final String serviceUrlPath = 'category/';
  RestClient client;

  Future<BaseListResponse<CategoryResponse>> getCategories(
      {int? pageSize, int? perPage, int? currentPage}) async {
    {
      final response = await client.get(
        '${serviceUrlPath}list',
      );
      final BaseListResponse<CategoryResponse> result =
          BaseListResponse<CategoryResponse>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => CategoryResponse.fromJson(
          json as Map<String, dynamic>,
        ),
      );

      return result;
    }
  }

}