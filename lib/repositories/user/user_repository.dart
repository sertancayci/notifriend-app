import 'package:notifriend/core/rest_client.dart';

class UserRepository {
  UserRepository({required this.client});

  final String serviceUrlPath = 'user/';

RestClient client;
}