
import 'package:notifriend/core/ui/ui_provider.dart';
import 'package:notifriend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingOverlay {
  static void setup() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..maskColor = Colors.black.withOpacity(0.5)
      ..userInteractions = false;
  }

  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return EasyLoading.init(builder: builder);
  }

  static Future<void> show({
    String? status,
    Widget? indicator,
    EasyLoadingMaskType? maskType,
    bool? dismissOnTap,
  }) {
    logger.i("SHOW");
    return EasyLoading.show(
      status: status,
      indicator: indicator,
      maskType: maskType,
      dismissOnTap: dismissOnTap,
    );
  }

  /// dismiss loading
  static Future<void> dismiss({
    bool animation = true,
  }) {
    //logger.i("DISMISS");
    return EasyLoading.dismiss(animation: animation);
  }


  static Future<void> executeAbsorb(
    BuildContext context,
    WidgetRef ref,
    Future<Null> Function() function, {
    Function(Exception, StackTrace?)? handleException,
    bool isGlobal = false,
  }) async {
    final uiProvider = ChangeNotifierProvider<UIProvider>((ref) {
      return UIProvider(buildContext: context);
    });
    try {

      ref.read(uiProvider).updateAbsorbing(true);

      await function();
    } catch (ex, stackTrace) {
      if (handleException != null) {
        handleException(ex as Exception, stackTrace);
      }
    }
    // finally {
    //   await
    // }

    ref.read(uiProvider).updateAbsorbing(true);
  }
}
