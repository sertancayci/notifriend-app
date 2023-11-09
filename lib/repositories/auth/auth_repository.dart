import 'package:notifriend/core/rest_client.dart';
import 'package:notifriend/models/auth/login_request.dart';
import 'package:notifriend/services/base/base_response.dart';

class AuthRepository {
  AuthRepository({required this.client);

  RestClient client;

  final String serviceUrlPath = 'auth/';

  Future<BaseResponse<String>> login(LoginRequest request) async {
    final response = await client.post('${serviceUrlPath}login', request.toJson());
    final BaseResponse<String> result = BaseResponse<String>.fromJson(
      response.data as Map<String, dynamic>,
      (json) => json as String,
    );

    return result;
  }
}