import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/helpers/app_services_with.dart';
import 'package:notifriend/models/channel/channel_response.dart';
import 'package:notifriend/models/notification/notification_response.dart';

class HomeNotifier extends StateNotifier<HomeState> with AppServices {
  HomeNotifier() : super(HomeState());

  Future<void> fetchNotifications() async {
    final List<NotificationResponse> notificationList =
        await notificationService.getNotifications();

    state = state.copyWith(notifications: notificationList);
  }

  Future <void> fetchChannels() async {
    final List<ChannelResponse> channelList =
       await channelService.getChannels();

    state = state.copyWith(channels: channelList);
  }

  //fetchPrivateChannels
  fetchPrivateChannels() async {
    final List<ChannelResponse> privateChannels =
    await channelService.getPrivateChannels();

    state = state.copyWith(forYouChannels: privateChannels);
  }

  Future<void> init() async {
    state = state.copyWith(isLoading: true);
    await fetchNotifications();
    await fetchPrivateChannels();
    await fetchChannels();
    state = state.copyWith(isLoading: false);
  }
}



class HomeState {
  HomeState({this.notifications, this.isLoading, this.channels, this.forYouChannels});

  final List<NotificationResponse>? notifications;
  final List<ChannelResponse>? channels;
  final List<ChannelResponse>? forYouChannels;
  final bool? isLoading;

  HomeState copyWith({List<NotificationResponse>? notifications,bool? isLoading, List<ChannelResponse>? channels, List<ChannelResponse>? forYouChannels}) {
    return HomeState(
      notifications: notifications ?? this.notifications,
      channels: channels ?? this.channels,
      forYouChannels: forYouChannels ?? this.forYouChannels,
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
