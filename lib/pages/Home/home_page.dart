import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/ui/base_scaffold.dart';
import 'package:notifriend/pages/Home/home_page_provider.dart';
import 'package:notifriend/pages/widgets/bottom_navigation_bar_widget.dart';
import 'package:notifriend/pages/widgets/network_image_loading_widget.dart';

final homeProvider =
    StateNotifierProvider<HomeNotifier, HomeState>((ref) => HomeNotifier());

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/home';

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final nameProvider = Provider<String>((ref) => 'Your Name');

  void initState() {
    super.initState();
    ref.read(homeProvider.notifier).fetchNotifications();
    ref.read(homeProvider.notifier).fetchPrivateChannels();
    ref.read(homeProvider.notifier).fetchChannels();
  }

  @override
  Widget build(BuildContext context) {
    // final homeProvider = Provider<HomeNotifier>(
    //         (ref) => HomeNotifier(buildContext: context));

    return BaseScaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Hello ${ref.watch(nameProvider)}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(selectedIndex: 0,),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              _lastNotificationSection(context, ref),
              _forYouChannelSection(context, ref),
              _channelsSection(context, ref),
            ],
          ),
        ),
      ),
    );
  }

  Widget _lastNotificationSection(BuildContext context, WidgetRef ref) {
    final lastNotifications = ref.watch(homeProvider).notifications;
    return lastNotifications != null
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.zero,
                child: ListTile(
                  minVerticalPadding: 0,
                  title: Text(
                    'Last Notification',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  trailing: TextButton(
                    onPressed: () {
                      // Handle "See All" button tap
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 80,
                padding: EdgeInsets.zero,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: lastNotifications.length,
                  padding: EdgeInsets.only(bottom: 10),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: CircleAvatar(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: ClipOval(
                            child: CachedNetworkImageWidget(
                              imageUrl: lastNotifications
                                  .elementAt(index)
                                  .message
                                  .thumbnail!,
                              placeholderWidth: 60,
                              placeholderHeight: 60,
                            ),
                          ),
                        ),
                      ),
                    );
                    // return Container(
                    //   width: 80,
                    //   height: 80,
                    //   child: ClipOval(
                    //     child: ListTile(
                    //       contentPadding: EdgeInsets.only(bottom: 16),
                    //       leading: Container(
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //         ),//
                    //         child: CachedNetworkImageWidget(
                    //           imageUrl: lastNotifications
                    //               .elementAt(index).message.thumbnail!,
                    //           placeholderWidth: 60,
                    //           placeholderHeight: 60,
                    //         ),
                    //       ),
                    //       onTap: () => null,
                    //     ),
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          )
        : Container();
  }

  Widget _forYouChannelSection(BuildContext context, WidgetRef ref) {
    final forYouItems = ref.watch(homeProvider).forYouChannels;
    return forYouItems != null ? Column(
      children: <Widget>[
        ListTile(
          title: Text(
            'For You',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          trailing: TextButton(
            onPressed: () {
              // Handle "See All" button tap
            },
            child: Text(
              'See All',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Container(
          height: 120, // Adjust the height as needed
          child: ListView.builder(
            padding: EdgeInsets.only(left: 1),
            scrollDirection: Axis.horizontal,
            itemCount: forYouItems!.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  children: [
                    CachedNetworkImageWidget(
                        imageUrl: forYouItems.elementAt(index).thumbnail!,
                        placeholderHeight: 84,
                        placeholderWidth: 100), // Provide the image path
                    Text(
                      forYouItems.elementAt(index).title,
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ): Container();
  }

  Widget _channelsSection(BuildContext context, WidgetRef ref) {
    final channels = ref.watch(homeProvider).channels;
    return channels != null
        ? Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Channels',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                trailing: TextButton(
                  onPressed: () {
                    // Handle "See All" button tap
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                height: 285, // Adjust the height as needed
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 50,
                  ),
                  padding: EdgeInsets.only(left: 16, right: 16),
                  itemCount: channels!.length, // Number of grid items
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CachedNetworkImageWidget(
                            imageUrl: channels.elementAt(index).thumbnail!,
                            placeholderHeight: 96,
                            placeholderWidth: 153), // Provide the image path
                        Text(
                          'Channel $index',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          )
        : Container();
  }

  Widget _buildGridItem(int index) {
    return Column(
      children: [
        Image.asset(
            'assets/channel_image_$index.png'), // Provide the image path
        Text(
          'Channel $index',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
