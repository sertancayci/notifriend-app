
import 'package:notifriend/core/services/storage/storage_service.dart';
import 'package:notifriend/models/channel/channel_response.dart';
import 'package:notifriend/repositories/channel/channel_repository.dart';

class ChannelService {


  ChannelService({required this.channelRespostory, required this.storageService});

  ChannelRepository channelRespostory;
  StorageService storageService;


  Future<List<ChannelResponse>> getChannels() async {
    final response = await channelRespostory.getChannels();

    return response.data!;
  }

}
