import 'package:notifriend/core/services/storage/storage_service.dart';
import 'package:notifriend/models/channel/channel_response.dart';
import 'package:notifriend/repositories/channel/channel_repository.dart';

class ChannelService {
  ChannelService(
      {required this.channelRespostory, required this.storageService});

  ChannelRepository channelRespostory;
  StorageService storageService;

  Future<List<ChannelResponse>> getChannels({int? categoryId}) async {
    final response =
        await channelRespostory.getChannels(categoryId: categoryId);

    return response.data!;
  }

  Future<List<ChannelResponse>> getPrivateChannels() async {
    final response = await channelRespostory.getPrivateChannels();

    return response.data!;
  }
}
