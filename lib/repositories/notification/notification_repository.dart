
import 'package:fpdart/fpdart.dart';
import 'package:notifriend/core/rest_client.dart';
import 'package:notifriend/models/notification/notification_response.dart';

import '../../services/base/base_response.dart';
import '../../services/base/base_list_response.dart';


class NotificationRepository {
  NotificationRepository({required this.client});

  final String serviceUrlPath = 'notification';
  RestClient client;

  Future<BaseResponse<BaseListResponse<NotificationResponse>>> getNotifications(
      {int? pageSize}) async {
    {
      final response = await client.get(
        '${serviceUrlPath}list?PageSize=99999&PageIndex=1',
      );
      final BaseResponse<BaseListResponse<NotificationResponse>> result =
          BaseResponse<BaseListResponse<NotificationResponse>>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => BaseListResponse<NotificationResponse>.fromJson(
          json as Map<String, dynamic>,
          (json) => NotificationResponse.fromJson(
            json as Map<String, dynamic>,
          ),
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
