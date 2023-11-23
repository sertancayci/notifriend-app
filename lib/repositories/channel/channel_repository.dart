import 'package:fpdart/fpdart.dart';
import 'package:notifriend/core/rest_client.dart';
import 'package:notifriend/models/channel/channel_response.dart';

import '../../services/base/base_list_response.dart';
import '../../services/base/base_response.dart';

class ChannelRepository {
  ChannelRepository({required this.client});

  final String serviceUrlPath = 'channel/';
  RestClient client;

  Future<BaseListResponse<ChannelResponse>> getChannels(
      {int? categoryId, int? pageSize, int? perPage, int? currentPage}) async {
    {
      String url = '${serviceUrlPath}list';

      if (categoryId != null) {
        url += '?categoryId=$categoryId';
      }

      final response = await client.get(url);

      // final response = await client.get(
      //   '${serviceUrlPath}list',
      // );

      final BaseListResponse<ChannelResponse> result =
          BaseListResponse<ChannelResponse>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => ChannelResponse.fromJson(
          json as Map<String, dynamic>,
        ),
      );

      return result;
    }
  }

  Future<BaseListResponse<ChannelResponse>> getPrivateChannels(
      {int? pageSize, int? perPage, int? currentPage}) async {
    {
      final response = await client.get(
        '${serviceUrlPath}privateChannels',
      );
      final BaseListResponse<ChannelResponse> result =
          BaseListResponse<ChannelResponse>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => ChannelResponse.fromJson(
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

  Future<BaseResponse<ChannelResponse>> getChannelDetail(channelId) async {
    {
      final response = await client.get(
        '${serviceUrlPath}$channelId',
      );
      final BaseResponse<ChannelResponse> result =
          BaseResponse<ChannelResponse>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => ChannelResponse.fromJson(
          json as Map<String, dynamic>,
        ),
      );

      return result;
    }
  }
}
