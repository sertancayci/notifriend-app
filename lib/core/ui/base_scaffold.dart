import 'package:flutter/material.dart';
import 'package:notifriend/core/helpers/app_services_with.dart';

class BaseScaffold extends StatelessWidget with AppServices {
  BaseScaffold({
    super.key,
    this.appBar,
    this.body,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.drawer,
    this.drawerEnableOpenDragGesture = true,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Color? backgroundColor;

  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  bool drawerEnableOpenDragGesture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: Container(
        child: body,
      ),
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      extendBody: true,
      // key: navigationService.scaffoldKey,
      drawer: drawer,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
    );
  }
}
