import 'package:fpdart/fpdart.dart';
import 'package:notifriend/core/rest_client.dart';
import 'package:notifriend/models/notification/notification_response.dart';

import '../../services/base/base_list_response.dart';
import '../../services/base/base_response.dart';

class NotificationRepository {
  NotificationRepository({required this.client});

  final String serviceUrlPath = 'notification/';
  RestClient client;

  Future<BaseListResponse<NotificationResponse>> getNotifications(
      {int? pageSize, int? perPage, int? currentPage}) async {
    {
      final response = await client.get(
        '${serviceUrlPath}list',
      );
      final BaseListResponse<NotificationResponse> result =
          BaseListResponse<NotificationResponse>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => NotificationResponse.fromJson(
          json as Map<String, dynamic>,
        ),
      );

      return result;
    }
  }

  Future<BaseListResponse<NotificationResponse>> getChannelNotifications(
      channelId,
      {int? pageSize,
      int? perPage,
      int? currentPage}) async {
    {
      final response = await client.get(
        '${serviceUrlPath}channelId',
      );
      final BaseListResponse<NotificationResponse> result =
          BaseListResponse<NotificationResponse>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => NotificationResponse.fromJson(
          json as Map<String, dynamic>,
        ),
      );

      return result;
    }
  }

  Future<BaseResponse<String>> deleteNotifications(
    List<String> ids,
  ) async {
    {
      String qStr = ids.mapWithIndex((t, index) => "ids=" + t).join("&");
      final response =
          await client.delete('${serviceUrlPath}notification?' + qStr);
      final BaseResponse<String> result = BaseResponse<String>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => json as String,
      );

      return result;
    }
  }
}
