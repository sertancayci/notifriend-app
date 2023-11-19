import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/ui/base_scaffold.dart';
import 'package:notifriend/pages/Category/category_page.dart';
import 'package:notifriend/pages/Channel/channel_page.dart';
import 'package:notifriend/pages/Home/home_page.dart';
import 'package:notifriend/pages/Login/login_page.dart';
import 'package:notifriend/pages/Splash/splash_page.dart';

String initialRoute = SplashPage.routeName;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashPage.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) {
          return ProviderScope(
            child: Consumer(builder: (context, watch, child) {
              return SplashPage();
            }),
          );
        },
      );
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
    case CategoryPage.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => CategoryPage(),
      );
    case ChannelsPage.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => ChannelsPage(),
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
