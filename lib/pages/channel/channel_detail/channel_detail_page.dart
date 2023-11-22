import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/ui/base_scaffold.dart';
import 'package:notifriend/pages/widgets/bottom_navigation_bar_widget.dart';

class ChannelDetailPageArguments {
  ChannelDetailPageArguments({required this.channelId});

  final int channelId;
}

class ChannelDetailPage extends ConsumerStatefulWidget {
  const ChannelDetailPage({required this.args, super.key});

  static const String routeName = '/channel-detail';

  final ChannelDetailPageArguments args;

  @override
  ConsumerState createState() => _ChannelDetailPageState();
}

class _ChannelDetailPageState extends ConsumerState<ChannelDetailPage> {
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
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.network(
          context.read(imageProvider),
          height: 200, // Adjust height as needed
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.read(titleProvider),
                style: TextStyle(
                    fontSize: 20, color: Colors.white, fontFamily: 'Roboto'),
              ),
              SizedBox(height: 8),
              Text(
                context.read(descriptionProvider),
                style: TextStyle(
                    fontSize: 16, color: Colors.white, fontFamily: 'Roboto'),
              ),
              SizedBox(height: 16),
              _buildUserPart(context),
              Divider(color: Colors.white),
              _buildMessagesList(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserPart(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20, // Adjust radius as needed
          backgroundImage: NetworkImage(context.read(userAvatarProvider)),
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.read(userNameProvider),
              style: TextStyle(
                  fontSize: 12, color: Colors.white, fontFamily: 'Roboto'),
            ),
            Text(
              context.read(userSurnameProvider),
              style: TextStyle(
                  fontSize: 12, color: Colors.white, fontFamily: 'Roboto'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMessagesList(BuildContext context) {
    final messages = context.read(messagesProvider);

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: messages.length,
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
