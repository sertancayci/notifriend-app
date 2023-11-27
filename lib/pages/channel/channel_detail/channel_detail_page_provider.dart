import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/helpers/app_services_with.dart';
import 'package:notifriend/models/channel/channel_response.dart';
import 'package:notifriend/models/notification/notification_response.dart';

class ChannelDetailNotifier extends StateNotifier<ChannelDetailState>
    with AppServices {
  ChannelDetailNotifier() : super(ChannelDetailState());

  Future<void> fetchChannelDetail(int? channelId) async {
    if (channelId == null) {
      return;
    }
    final channelDetail = await channelService.getChannelDetail(channelId);

    state = state.copyWith(channelDetail: channelDetail);
  }

  Future<void> fetchChannelNotifications(int channelId) async {
   final channelNotification = await notificationService.getChannelNotifications(channelId);

    state = state.copyWith(channelNotification: channelNotification);
  }

  Future<void> init(int? categoryId) async {
    state = state.copyWith(isLoading: true);
    await fetchChannelDetail(categoryId!);
    await fetchChannelNotifications(channelId);
    state = state.copyWith(isLoading: false);
  }
}

class ChannelDetailState {
  ChannelDetailState({
    this.isLoading,
    this.channelDetail,
    required this.channelNotification,
  });

  final ChannelResponse? channelDetail;
  final bool? isLoading;
  final NotificationResponse channelNotification;

  ChannelDetailState copyWith(
      {List<NotificationResponse>? notifications,
      bool? isLoading,
      ChannelResponse? channelDetail,
        List<NotificationResponse>? channelNotification
      List<ChannelResponse>? forYouChannels}) {
    return ChannelDetailState(
      channelDetail: channelDetail ?? this.channelDetail,
      isLoading: isLoading ?? this.isLoading,
      channelNotification: channelNotification ?? this.channelNotification,
    );
  }
}
