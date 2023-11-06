import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/helpers/app_services_with.dart';
import 'package:notifriend/models/notification/notification_response.dart';

class HomeNotifier extends StateNotifier<HomeState> with AppServices {
  HomeNotifier() : super(HomeState());

  Future<void> fetchNotifications() async {
    final List<NotificationResponse> notificationList =
        await notificationService.getNotifications();

    state = state.copyWith(notifications: notificationList);
  }

  Future<void> init() async {
    state = state.copyWith(isLoading: true);
    await fetchNotifications();
    state = state.copyWith(isLoading: false);
  }
}





class HomeState {
  HomeState({this.notifications, this.isLoading});

  final List<NotificationResponse>? notifications;
  final bool? isLoading;

  HomeState copyWith({List<NotificationResponse>? notifications,bool? isLoading}) {
    return HomeState(
      notifications: notifications ?? this.notifications,
      isLoading: isLoading ?? this.isLoading,
    );
  }

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
