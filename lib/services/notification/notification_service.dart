
import 'package:notifriend/core/services/storage/storage_service.dart';
import 'package:notifriend/models/notification/notification_response.dart';
import 'package:notifriend/repositories/notification/notification_repository.dart';

class NotificationService {


  NotificationService({required this.notificationRepository, required this.storageService});

  NotificationRepository notificationRepository;
  StorageService storageService;


  Future<List<NotificationResponse>> getNotifications() async {
    final response = await notificationRepository.getNotifications();

    return response.data!;
  }

}
