import 'package:notifriend/core/services/navigation_service.dart';
import 'package:notifriend/core/services/storage/storage_service.dart';
import 'package:notifriend/services/channel/channel_service.dart';
import 'package:notifriend/services/notification/notification_service.dart';
import 'package:notifriend/main.dart';

mixin AppServices {
  final StorageService storageService = getIt.get<StorageService>();
  final NavigationService navigationService = getIt.get<NavigationService>();
  final NotificationService notificationService = getIt.get<NotificationService>();
  final ChannelService channelService = getIt.get<ChannelService>();
}