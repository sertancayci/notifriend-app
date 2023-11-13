
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/helpers/app_services_with.dart';
import 'package:notifriend/core/services/storage/storage_service.dart';
import 'package:notifriend/core/ui/base_scaffold.dart';
import 'package:notifriend/pages/Home/home_page.dart';
import 'package:notifriend/pages/Login/login_page.dart';
import 'package:notifriend/theme/app_theme.dart';

class SplashPage extends ConsumerStatefulWidget with AppServices {
   SplashPage({super.key});

   static const String routeName = '/splash';


  @override
  ConsumerState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {

  void initState() {
    super.initState();
    checkAuthToken();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          height: 72,
          width: 272,
          child: Image(
            image: AppImages.logo,
          ),
        ),
      ),
    );
  }

  Future<void> checkAuthToken() async {
    final String? authToken = await widget.storageService.getAuthToken();

    if (authToken != null) {
      widget.navigationService .navigateToNamedAndRemoveUntil(HomePage.routeName);
    } else {
      widget.navigationService .navigateToNamedAndRemoveUntil(LoginPage.routeName);
    }
  }
}
