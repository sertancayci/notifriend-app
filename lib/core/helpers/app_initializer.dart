

import 'package:notifriend/core/helpers/app_setup_locator.dart';

class AppInitializer {
  AppInitializer._();

  static Future<void> initialize() async {
    await AppSetupLocator.setupLocator();
  }
}
