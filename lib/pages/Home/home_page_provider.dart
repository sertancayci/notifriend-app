import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/helpers/app_services_with.dart';
import 'package:notifriend/models/notification/notification_response.dart';

class HomeNotifier extends StateNotifier<HomeState> with AppServices {
  HomeNotifier() : super(HomeState());

  Future<void> init() async {
    final List<NotificationResponse> notificationList =
        await notificationService.getNotifications();

    state = HomeState(notifications: notificationList);
  }
}

class HomeState {
  HomeState({this.notifications});

  final List<NotificationResponse>? notifications;
}
