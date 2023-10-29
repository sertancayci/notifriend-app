import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final nameProvider = Provider<String>((ref) => 'Your Name');

  final notificationsProvider = Provider<List<String>>((ref) => [
    'Notification 1',
    'Notification 2',
    // Add more notifications
  ]);

  final forYouItemsProvider = Provider<List<String>>((ref) => [
    'Item 1',
    'Item 2',
    // Add more items
  ]);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Hello ${ref.watch(nameProvider)}'),
      ),
      body: Column(
        children: <Widget>[
          _lastNotificationSection(context, ref),
          _forYouChannelSection(context, ref),
        ],
      ),
    );
  }

 Widget _lastNotificationSection(BuildContext context, WidgetRef ref) {
   return Column(
     children: <Widget>[
       ListTile(
         title: Text('Last Notification'),
         trailing: TextButton(
           onPressed: () {
             // Handle "See All" button tap
           },
           child: Text('See All'),
         ),
       ),
       Container(
         height: 80, // Adjust the height as needed
         child: ListView.builder(
           scrollDirection: Axis.horizontal,
           itemCount: ref.watch(notificationsProvider).length,
           itemBuilder: (context, index) {
             return CircleAvatar(
               radius: 30, // Adjust the size as needed
               backgroundImage: AssetImage('assets/notification_image.png'), // Provide the image path
             );
           },
         ),
       ),
     ],
   );
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


}
