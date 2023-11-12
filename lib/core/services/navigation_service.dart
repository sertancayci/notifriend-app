import 'package:notifriend/core/ui/loading_overlay.dart';
import 'package:notifriend/main.dart';
import 'package:flutter/material.dart';

class NavigationService {
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  bool _isNavigating = false;

  bool get isNavigating => _isNavigating;

  void setNavigating(bool value) {
    _isNavigating = value;
  }

  Future<dynamic>? navigateTo(String routeName, {Object? arguments}) async {
    await LoadingOverlay.dismiss();
    // if (!isNavigating) {
    //   setNavigating(true);
    //   return navigatorKey.currentState!
    //       .pushNamed(routeName, arguments: arguments).then((_) {
    //     setNavigating(false);
    //   });
    // }
    //
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<Object?>? navigateToNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) async {
    await LoadingOverlay.dismiss();
    if (navigatorKey.currentState != null) {
      return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        arguments: arguments,
      );
    }

    return null;
  }

  Future<void> goBack() async {
    await LoadingOverlay.dismiss();
    navigatorKey.currentState!.pop();
  }

  Future<bool> maybePop() async {
    await LoadingOverlay.dismiss();
    return navigatorKey.currentState!.maybePop();
  }

  Future<void> pop() async {
    // await LoadingOverlay.dismiss();
    return navigatorKey.currentState!.pop();
  }

  Future<dynamic>? pushReplacementNamed(String routeName,
      {Object? arguments}) async {
    await LoadingOverlay.dismiss();
    if (navigatorKey.currentState != null) {
      return navigatorKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    }
    return null;
  }

  Future<void> popUntil(String toRouteName, String untilRouteName,{Object? arguments}) async {
    await LoadingOverlay.dismiss();
    await navigatorKey.currentState!.pushNamed(toRouteName,arguments:arguments).then((value) {
      navigatorKey.currentState!.popUntil(ModalRoute.withName(untilRouteName));
    });
  }

// void openDrawer() {
//   scaffoldKey.currentState!.openDrawer();
// }
}
