import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/core_initializer.dart';
import 'package:notifriend/core/helpers/app_initializer.dart';
import 'package:notifriend/core/helpers/logger.dart';
import 'package:notifriend/core/ui/loading_overlay.dart';
import 'package:notifriend/pages/Home/home_page.dart';
import 'package:notifriend/pages/Login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final getIt = GetIt.instance;
late SharedPreferences storage;

final logger = NotifLogger(
  printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
  level:
  Level.debug, // Change the default log level (-> only log in debug mode)
);

Future<void> main() async {
  // runApp(const MyApp());
   runZonedGuarded<Future<void>>(() async {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.black,
    ));

    WidgetsFlutterBinding.ensureInitialized();
    storage = await SharedPreferences.getInstance();
    await CoreInitializer.initialize();
    await AppInitializer.initialize();

    runApp(ProviderScope(child: MyApp()));
   }, (error, stack) {
     logger.e('main.dart ZonedGuarded error', error: error, stackTrace: stack);
     LoadingOverlay.dismiss();
   });


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifriend',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}
