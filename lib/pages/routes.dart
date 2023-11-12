import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/ui/base_scaffold.dart';
import 'package:notifriend/pages/Home/home_page.dart';
import 'package:notifriend/pages/Login/login_page.dart';


String initialRoute = LoginPage.routeName;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case LoginPage.routeName:
    //   return MaterialPageRoute(
    //     settings: settings,
    //     builder: (BuildContext context) {
    //       return ProviderScope(
    //         child: Consumer(builder: (context, watch, child) {
    //           // Use watch to obtain the providers you need
    //           final splashProvider = ref.watch(splashProviderProvider);
    //
    //           return SplashPage();
    //         }),
    //       );
    //     },
    //   );
    case LoginPage.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => LoginPage(),
      );
    // case RegisterPage.routeName:
    //   return MaterialPageRoute(
    //     settings: settings,
    //     builder: (BuildContext context) => RegisterPage(),
    //   );
    case HomePage.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => HomePage(),
      );
    // case NotificationPage.routeName:
    //   return MaterialPageRoute(
    //     settings: settings,
    //     builder: (BuildContext context) {
    //       return MultiProvider(
    //         providers: [
    //           ChangeNotifierProvider<NotificationPageProvider>(
    //             create: (context) =>
    //                 NotificationPageProvider(buildContext: context),
    //           ),
    //         ],
    //         child: NotificationPage(),
    //       );
    //     },
    //   );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) {
          return BaseScaffold(
            body: const Center(child: Text('No route defined')),
          );
        },
      );
  }
}
