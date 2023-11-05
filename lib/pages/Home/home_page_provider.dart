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

//
// class HomeNotifier extends BaseChangeNotifier with AppServices {
//   HomeNotifier({required super.buildContext}) {
//     logger.i('HomeNotifier');
//     init();
//   }
//
//   List<NotificationResponse> _notificationList = [];
//
//   List<NotificationResponse> get notificationList => _notificationList;
//
//   set notificationList(List<NotificationResponse> value) {
//     _notificationList = value;
//     notifyListeners();
//   }
//
//   Future<void> init() async {
//     final notificationListResponse =
//     await notificationService.getNotifications();
//
//     notificationList = notificationListResponse;
//
//     viewState = ViewState.Idle;
//     dataState = DataState.HasData;
//   }
// }
