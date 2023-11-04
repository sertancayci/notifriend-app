import 'package:notifriend/core/core_setup_locator.dart';
import 'package:notifriend/core/ui/loading_overlay.dart';

class CoreInitializer {
  CoreInitializer._();

  static Future<void> initialize() async {
    // await initializeDateFormatting();
    await CoreSetupLocator.setupLocator();
    LoadingOverlay.setup();
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
  }
}
