import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/ui/base_scaffold.dart';
import 'package:notifriend/models/channel/channel_response.dart'; // Import your ChannelResponse model
import 'package:notifriend/pages/widgets/bottom_navigation_bar_widget.dart';
import 'package:notifriend/providers/channel_notifier.dart'; // Import your ChannelNotifier
import 'package:notifriend/services/channels_service.dart'; // Import your ChannelsService

final channelsProvider = FutureProvider<List<ChannelResponse>>((ref) async {
  final notifier = ref.watch(channelProvider.notifier);
  final categoryId = notifier.categoryId;
  if (categoryId != null) {
    return ChannelsService.fetchChannelsByCategoryId(categoryId);
  } else {
    return ChannelsService.fetchAllChannels();
  }
});

class ChannelsPage extends ConsumerStatefulWidget {
  final int? categoryId;

  ChannelsPage({this.categoryId, Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _CategoryChannelsPageState();
}

class _CategoryChannelsPageState extends ConsumerState<ChannelsPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Channels', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(selectedIndex: 2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            _buildSearchBar(context),
            SizedBox(height: 16),
            _buildChannelsGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChannelsGrid(BuildContext context) {
    return Expanded(
      child: Consumer(
        builder: (context, watch, child) {
          final channels = watch(channelsProvider);
          return channels.when(
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(child: Text('Error: $error')),
            data: (channelList) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 174 / 117,
                ),
                itemCount: channelList.length,
                itemBuilder: (context, index) {
                  final channel = channelList[index];
                  return _buildChannelItem(channel);
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildChannelItem(ChannelResponse channel) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.all(8),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              channel.imageUrl,
              width: 174,
              height: 117,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              channel.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
