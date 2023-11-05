import 'package:dio/dio.dart';
import 'package:notifriend/core/rest_client.dart';
import 'package:notifriend/core/services/navigation_service.dart';
import 'package:notifriend/core/services/storage/storage_service.dart';
import 'package:notifriend/main.dart';
import 'package:notifriend/repositories/notification/notification_repository.dart';


class CoreSetupLocator {
  static Future<void> setupLocator() async {
    // final cacheOptions = await RestClient.cacheOptions;

    getIt
      ..registerLazySingleton<Dio>(() {
        final dio = Dio(BaseOptions().copyWith(
          // connectTimeout: Duration(seconds: 1),
          // receiveTimeout: Duration(seconds: 1),
          // sendTimeout: Duration(seconds: 1),
        ));

        dio.interceptors.add(
          LogInterceptor(
            responseBody: true,
            requestBody: true,
          ),
        );
        // dio.interceptors.add(
        // DioCacheInterceptor(options: cacheOptions),
        // );
        return dio;
      })

      ..registerLazySingleton<NavigationService>(() => NavigationService())
      ..registerLazySingleton<StorageService>(() => StorageService());
  }
}
