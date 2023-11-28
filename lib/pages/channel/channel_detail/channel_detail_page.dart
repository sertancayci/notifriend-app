import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/ui/base_scaffold.dart';
import 'package:notifriend/models/channel/channel_response.dart';
import 'package:notifriend/pages/channel/channel_detail/channel_detail_page_provider.dart';
import 'package:notifriend/pages/widgets/bottom_navigation_bar_widget.dart';
import 'package:notifriend/pages/widgets/network_image_loading_widget.dart';

class ChannelDetailPageArguments {
  ChannelDetailPageArguments({required this.channelId});

  final int channelId;
}

final channelDetailProvider =
    StateNotifierProvider<ChannelDetailNotifier, ChannelDetailState>(
        (ref) => ChannelDetailNotifier());

class ChannelDetailPage extends ConsumerStatefulWidget {
  const ChannelDetailPage({required this.args, super.key});

  static const String routeName = '/channel-detail';

  final ChannelDetailPageArguments args;

  @override
  ConsumerState createState() => _ChannelDetailPageState();
}

class _ChannelDetailPageState extends ConsumerState<ChannelDetailPage> {
  void initState() {
    super.initState();
    if (widget.args!.channelId != null) {
      ref
          .read(channelDetailProvider.notifier)
          .fetchChannelDetail(widget.args!.channelId!);
      ref
          .read(channelDetailProvider.notifier)
          .fetchChannelNotifications(widget.args!.channelId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Detail', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 1,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final channel = ref.watch(channelDetailProvider).channelDetail;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CachedNetworkImageWidget(
          imageUrl: channel!.thumbnail!,
          placeholderHeight: 300,
          placeholderWidth: double.maxFinite,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                channel.title,
                style: TextStyle(
                    fontSize: 20, color: Colors.white, fontFamily: 'Roboto'),
              ),
              SizedBox(height: 8),
              Text(
                channel.description,
                style: TextStyle(
                    fontSize: 16, color: Colors.white, fontFamily: 'Roboto'),
              ),
              SizedBox(height: 16),
              _buildUserPart(context, channel.owner),
              Divider(color: Colors.white),
              _buildMessagesList(context, ref),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserPart(BuildContext context, OwnerResponse owner) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20, // Adjust radius as needed
          backgroundImage: NetworkImage(owner.avatar!),
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              owner.username != null ? owner.username! : owner.name,
              style: TextStyle(
                  fontSize: 12, color: Colors.white, fontFamily: 'Roboto'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMessagesList(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(channelDetailProvider).notifications;
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 20, // Adjust radius as needed
            // Use a unique avatar for each user or sender
          ),
          title: Text(messages[index].sender,
              style: TextStyle(
                  fontSize: 12, color: Colors.white, fontFamily: 'Roboto')),
          subtitle: Text(messages[index].text,
              style: TextStyle(
                  fontSize: 12, color: Colors.white, fontFamily: 'Roboto')),
        );
      },
    );
  }
}
