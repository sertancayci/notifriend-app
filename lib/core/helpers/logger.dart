import 'package:notifriend/core/exceptions/app_exceptions.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:logger/logger.dart';

class NotifLogger extends Logger {
  /// You can provide a custom [printer], [filter] and [output]. Otherwise the
  /// defaults: [PrettyPrinter], [DevelopmentFilter] and [ConsoleOutput] will be
  /// used.
  NotifLogger({
    super.filter,
    super.printer,
    super.output,
    super.level,
  });

  @override
  void e(dynamic message, {Object? error, StackTrace? stackTrace, DateTime? time}) {
    super.e(message, error: error, stackTrace: stackTrace, time: time);
    try {
      if (error is ApiException) return;
      FirebaseCrashlytics.instance.recordError(
        error, stackTrace,
        reason: message,
        // reason: 'a fatal error',
        // Pass in 'fatal' argument
        fatal: true,
      );
    } catch (ex) {
      print('Loggin exception!');
      print(ex);
    }
  }
}
