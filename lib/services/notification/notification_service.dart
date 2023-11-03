
import 'package:notifriend/models/notification/notification_response.dart';
import 'package:notifriend/repositories/notification/notification_repository.dart';

class NotificationService {
  NotificationService({
    required NotificationRepository notificationRepository,
  }) {
    _notificationRepository = notificationRepository;
  }

  late NotificationRepository _notificationRepository;

  Future<List<NotificationResponse>> getNotifications() async {
    final response = await _notificationRepository.getNotifications();

    return response.data!.data!;
  }

  Future<bool> deleteNotification(String id) async {
    final response = await _notificationRepository.deleteNotifications([id]);

    return true;
  }

  Future<bool> deleteNotifications(List<String> ids) async {
    final response = await _notificationRepository.deleteNotifications(ids);

    return true;
  }
}
