import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/ui/base_scaffold.dart';
import 'package:notifriend/models/channel/channel_response.dart'; // Import your ChannelResponse model
import 'package:notifriend/pages/Channel/channel_page_provider.dart';
import 'package:notifriend/pages/widgets/bottom_navigation_bar_widget.dart'; // Import your ChannelsService

class ChannelsPagePageArguments {
  ChannelsPagePageArguments({required this.categoryId});

  final int? categoryId;
}

final channelsProvider = StateNotifierProvider<ChannelNotifier, ChannelState>(
    (ref) => ChannelNotifier());

class ChannelsPage extends ConsumerStatefulWidget {
  static const String routeName = '/channels';

  ChannelsPage({this.args, Key? key}) : super(key: key);

  final ChannelsPagePageArguments? args;

  @override
  ConsumerState createState() => _CategoryChannelsPageState();
}

class _CategoryChannelsPageState extends ConsumerState<ChannelsPage> {
  void initState() {
    super.initState();
    if (widget.args!.categoryId != null) {
      ref
          .read(channelsProvider.notifier)
          .fetchChannels(widget.args!.categoryId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Channels', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
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
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChannelsGrid(BuildContext context) {
    final channels = ref.watch(channelsProvider).channels;
    if (channels == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Expanded(
      child: Consumer(
        builder: (context, watch, child) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 174 / 117,
            ),
            itemCount: channels!.length,
            itemBuilder: (context, index) {
              final channel = channels[index];
              return _buildChannelItem(channel);
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
              channel.thumbnail!,
              width: 174,
              height: 117,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              channel.title,
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
