import 'package:dio/dio.dart';
import 'package:notifriend/core/rest_client.dart';
import 'package:notifriend/core/services/storage/storage_service.dart';
import 'package:notifriend/main.dart';
import 'package:notifriend/repositories/notification/notification_repository.dart';
import 'package:notifriend/services/notification/notification_service.dart';

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
      //Services
      ..registerLazySingleton<NotificationService>(
        () => NotificationService(
          notificationRepository: getIt<NotificationRepository>(),
          storageService: getIt<StorageService>(),
        ),
      );
  }
}
