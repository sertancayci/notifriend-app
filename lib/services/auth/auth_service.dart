import 'package:notifriend/core/services/storage/storage_service.dart';
import 'package:notifriend/models/auth/login_request.dart';
import 'package:notifriend/models/auth/login_response.dart';
import 'package:notifriend/repositories/auth/auth_repository.dart';
import 'package:notifriend/services/base/base_response.dart';

class AuthService {
  AuthService({
    required AuthRepository authRepository,
    required StorageService storageService,
}) {
    _authRepository = authRepository;
    _storageService = storageService;
  }

  late AuthRepository _authRepository;
  late StorageService _storageService;

  Future<BaseResponse<LoginResponse>> login(LoginRequest request) async {
    final response = await _authRepository.login(request);
    await _saveAuthToken(response.data!.token!);
    return response;
  }

  Future<void> _saveAuthToken(String data) async {
    await _storageService.saveAuthToken(data);
  }


}