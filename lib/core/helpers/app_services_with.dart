import 'package:notifriend/core/services/navigation_service.dart';
import 'package:notifriend/core/services/storage/storage_service.dart';
import 'package:notifriend/main.dart';
import 'package:notifriend/services/auth/auth_service.dart';
import 'package:notifriend/services/category/category_service.dart';
import 'package:notifriend/services/channel/channel_service.dart';
import 'package:notifriend/services/notification/notification_service.dart';
import 'package:notifriend/services/user/user_service.dart';

mixin AppServices {
  final StorageService storageService = getIt.get<StorageService>();
  final NavigationService navigationService = getIt.get<NavigationService>();
  final NotificationService notificationService =
      getIt.get<NotificationService>();
  final ChannelService channelService = getIt.get<ChannelService>();
  final AuthService authService = getIt.get<AuthService>();
  final UserService userService = getIt.get<UserService>();
  final CategoryService categoryService = getIt.get<CategoryService>();
  final ChannelService channelService = getIt.get<ChannelService>();
}
