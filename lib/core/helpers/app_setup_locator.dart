import 'package:dio/dio.dart';
import 'package:notifriend/core/rest_client.dart';
import 'package:notifriend/core/services/storage/storage_service.dart';
import 'package:notifriend/main.dart';
import 'package:notifriend/repositories/auth/auth_repository.dart';
import 'package:notifriend/repositories/channel/channel_repository.dart';
import 'package:notifriend/repositories/notification/notification_repository.dart';
import 'package:notifriend/repositories/user/user_repository.dart';
import 'package:notifriend/services/auth/auth_service.dart';
import 'package:notifriend/services/channel/channel_service.dart';
import 'package:notifriend/services/notification/notification_service.dart';
import 'package:notifriend/services/user/user_service.dart';

class AppSetupLocator {
  static Future<void> setupLocator() async {
    getIt
      ..registerLazySingleton(() => RestClient(
            getIt<Dio>(),
            getIt<StorageService>(),
          ))
      // Repositories
      ..registerLazySingleton<NotificationRepository>(
        () => NotificationRepository(
          client: getIt<RestClient>(),
        ),
      )
      ..registerLazySingleton<AuthRepository>(
        () => AuthRepository(
          client: getIt<RestClient>(),
        ),
      )
      ..registerLazySingleton<ChannelRepository>(
        () => ChannelRepository(
          client: getIt<RestClient>(),
        ),
      )
      ..registerLazySingleton<UserRepository>(
        () => UserRepository(
          client: getIt<RestClient>(),
        ),
      )
      //Services
      ..registerLazySingleton<NotificationService>(
        () => NotificationService(
          notificationRepository: getIt<NotificationRepository>(),
          storageService: getIt<StorageService>(),
        ),
      )
      ..registerLazySingleton<AuthService>(
        () => AuthService(
          authRepository: getIt<AuthRepository>(),
          storageService: getIt<StorageService>(),
        ),
      )
      ..registerLazySingleton<ChannelService>(
        () => ChannelService(
          channelRespostory: getIt<ChannelRepository>(),
          storageService: getIt<StorageService>(),
        ),
      )
        ..registerLazySingleton<UserService>(
        () => UserService(
          userRepository: getIt<UserRepository>(),
          storageService: getIt<StorageService>(),
        )
      );

  }
}
