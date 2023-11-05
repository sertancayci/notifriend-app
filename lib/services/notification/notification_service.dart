
import 'package:notifriend/core/services/storage/storage_service.dart';
import 'package:notifriend/models/notification/notification_response.dart';
import 'package:notifriend/repositories/notification/notification_repository.dart';

class NotificationService {

  NotificationRepository notificationRepository;
  StorageService storageService;

  NotificationService({required this.notificationRepository, required this.storageService});


  late NotificationRepository _notificationRepository;

  Future<List<NotificationResponse>> getNotifications() async {
    final response = await _notificationRepository.getNotifications();

    return response.data!.data!;
  }

}
