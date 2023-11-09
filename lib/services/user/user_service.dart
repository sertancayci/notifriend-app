import 'package:notifriend/core/services/storage/storage_service.dart';
import 'package:notifriend/repositories/user/user_repository.dart';

class UserService {
  UserService({
    required UserRepository userRepository,
    required StorageService storageService,
  }) {
    _userRepository = userRepository;
    _storageService = storageService;
  }

  late UserRepository _userRepository;
  late StorageService _storageService;
}