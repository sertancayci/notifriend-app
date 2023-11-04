import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/core_initializer.dart';
import 'package:notifriend/core/helpers/logger.dart';
import 'package:notifriend/pages/Home/home_page..dart';
import 'package:notifriend/pages/Login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';

late SharedPreferences storage;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final logger = NotifLogger(
  printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
  level:
      Level.debug, // Change the default log level (-> only log in debug mode)
);
final getIt = GetIt.instance;

Future<void> main() async {
  // runApp(const MyApp());
  await CoreInitializer.initialize();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}
