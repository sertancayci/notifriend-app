import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/services/navigation_service.dart';
import 'package:notifriend/main.dart';
import 'package:notifriend/pages/Home/home_page.dart';
class BottomNavigationBarWidget extends StatefulWidget {
  final int selectedIndex;

  const BottomNavigationBarWidget({Key? key, this.selectedIndex = -1})
      : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  NavigationService _navigationService = getIt<NavigationService>();

  @override
  Widget build(BuildContext context) {
      return SizedBox(
        height: 60,
        child: BottomNavigationBar(
          unselectedLabelStyle: const TextStyle(color: Colors.white),
          unselectedItemColor: Colors.white,
          currentIndex: widget.selectedIndex,
          onTap: (index) {
            if (index == 0) {
              _navigationService.navigateToNamedAndRemoveUntil(HomePage.routeName);
            }
            // else if (index == 1 && widget.selectedIndex != index) {
            //   _navigationService.navigateToNamedAndRemoveUntil(CategoryPage.routeName);
            // } else if (index == 2 && widget.selectedIndex != index) {
            //   _navigationService.navigateToNamedAndRemoveUntil(NewNotif.routeName);
            // } else if (index == 3) {
            //   _navigationService.navigateToNamedAndRemoveUntil(NotificationsPage.routeName);
            // } else if (index == 4 && widget.selectedIndex != index) {
            //   _navigationService.navigateToNamedAndRemoveUntil(ProfilePage.routeName);
            // }
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          fixedColor: Colors.white,
          items: <BottomNavigationBarItem>[
            barItem(
                label: "Home",
                activeIcon: Icons.home,
                icon: Icons.home_outlined),
            barItem(
                label: "Categories",
                activeIcon: Icons.widgets,
                icon: Icons.widgets_outlined),
            barItem(
                label: "NewNotif",
                activeIcon: Icons.notification_add,
                icon: Icons.notification_add_outlined),
            barItem(
                label: "Notifications",
                activeIcon: Icons.notifications_active,
                icon: Icons.notifications_active_outlined),
            barItem(
                label: "Settings",
                activeIcon: Icons.manage_accounts,
                icon: Icons.manage_accounts_outlined),
          ],
        ),
      );

  }

  BottomNavigationBarItem barItem(
      {required String label,
      required IconData icon,
      required IconData activeIcon}) {
    return BottomNavigationBarItem(
      activeIcon: Icon(
        activeIcon,
        color: Colors.white,
      ),
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: label,
    );
  }
}
