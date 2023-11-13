import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/ui/base_scaffold.dart';
import 'package:notifriend/pages/Home/home_page_provider.dart';
import 'package:notifriend/pages/widgets/network_image_loading_widget.dart';


final homeProvider = StateNotifierProvider<HomeNotifier,HomeState>((ref) => HomeNotifier());



class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/home';

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final nameProvider = Provider<String>((ref) => 'Your Name');

  final forYouItemsProvider = Provider<List<String>>((ref) => [
    'Item 1',
    'Item 2',
    // Add more items
  ]);

  void initState() {
    super.initState();
    ref.read(homeProvider.notifier).fetchNotifications();
    ref.read(homeProvider.notifier).fetchChannels();
  }


  @override
  Widget build(BuildContext context) {

    // final homeProvider = Provider<HomeNotifier>(
    //         (ref) => HomeNotifier(buildContext: context));

    return  BaseScaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Hello ${ref.watch(nameProvider)}' , style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _lastNotificationSection(context, ref),
            // _forYouChannelSection(context, ref),
            _channelsSection(context, ref),
          ],
        ),
      ),
    );
  }

 Widget _lastNotificationSection(BuildContext context, WidgetRef ref) {
   final lastNotifications = ref.watch(homeProvider).notifications;
   return lastNotifications != null ? Container(
     child: Column(
       mainAxisSize: MainAxisSize.min,
       children: <Widget>[
         Container(
           child: ListTile(
             title: Text('Last Notification', style: TextStyle(color: Colors.white,),),
             trailing: TextButton(
               onPressed: () {
                 // Handle "See All" button tap
               },
               child: Text('See All', style: TextStyle(color: Colors.white,),),
             ),
           ),
         ),
         Expanded(
           child: Container(
             padding: EdgeInsets.only(left: 24, top: 42),
             child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount: lastNotifications.length,
               itemBuilder: (context, index) {
                 return ListTile(
                   contentPadding: EdgeInsets.only(bottom: 16),
                   leading: Container(
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: Colors.white,
                     ),
                     child: CachedNetworkImageWidget(
                       imageUrl: lastNotifications
                           .elementAt(index).message.thumbnail!,
                       placeholderWidth: 60,
                       placeholderHeight: 60,
                     ),
                   ),
                   onTap: () => null,
                 );
               },
             ),
           ),
         ),
       ],
     ),
   ) : Container();
 }

 Widget _forYouChannelSection(BuildContext context, WidgetRef ref) {
   return Column(
     children: <Widget>[
       ListTile(
         title: Text('For You'),
         trailing: TextButton(
           onPressed: () {
             // Handle "See All" button tap
           },
           child: Text('See All'),
         ),
       ),
       Container(
         height: 120, // Adjust the height as needed
         child: ListView.builder(
           scrollDirection: Axis.horizontal,
           itemCount: ref.watch(forYouItemsProvider).length,
           itemBuilder: (context, index) {
             return Column(
               children: [
                 Image.asset('assets/for_you_item_image.png'), // Provide the image path
                 Text(
                   ref.watch(forYouItemsProvider)[index],
                   style: TextStyle(color: Colors.white.withOpacity(0.5)),
                 ),
               ],
             );
           },
         ),
       ),
     ],
   );
 }

  Widget _channelsSection(BuildContext context, WidgetRef ref) {
    final channels = ref.watch(homeProvider).channels;
    return channels != null ? Column(
      children: <Widget>[
        ListTile(
          title: Text('Channeld'),
          trailing: TextButton(
            onPressed: () {
              // Handle "See All" button tap
            },
            child: Text('See All'),
          ),
        ),
        Container(
          height: 192, // Adjust the height as needed
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // You can adjust the number of columns
              crossAxisSpacing: 8, // Adjust the spacing as needed
              mainAxisSpacing: 8, // Adjust the spacing as needed
            ),
            itemCount: channels!.length, // Number of grid items
            itemBuilder: (context, index) {
              return _buildGridItem(index);
            },
          ),
        ),
      ],
    ) : Container();
  }

  Widget _buildGridItem(int index) {
    return Column(
      children: [
        Image.asset('assets/channel_image_$index.png'), // Provide the image path
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
