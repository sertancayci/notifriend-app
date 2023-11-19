import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/helpers/app_services_with.dart';
import 'package:notifriend/models/channel/channel_response.dart';
import 'package:notifriend/models/notification/notification_response.dart';

class ChannelNotifier extends StateNotifier<ChannelState> with AppServices {
  ChannelNotifier() : super(ChannelState());

  Future<void> fetchChannels(int categoryId) async {
    final List<ChannelResponse> channelList =
        await channelService.getChannels(categoryId: categoryId);

    state = state.copyWith(channels: channelList);
  }

  Future<void> init(int? categoryId) async {
    state = state.copyWith(isLoading: true);
    await fetchChannels(categoryId!);
    state = state.copyWith(isLoading: false);
  }
}

class ChannelState {
  ChannelState({
    this.isLoading,
    this.channels,
  });

  final List<ChannelResponse>? channels;
  final bool? isLoading;

  ChannelState copyWith(
      {List<NotificationResponse>? notifications,
      bool? isLoading,
      List<ChannelResponse>? channels,
      List<ChannelResponse>? forYouChannels}) {
    return ChannelState(
      channels: channels ?? this.channels,
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
