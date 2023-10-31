import 'package:notifriend/main.dart';

class AppException implements Exception {
  AppException({
    String? exceptionMessage,
    StackTrace? stack,
    Exception? exception,
  }) {
    message = exceptionMessage;
    stackTrace = stack;
    exception = exception;
  }

  factory AppException.fromFlutterException(Object e, StackTrace? stack) {
    if (e is UnauthorizedException) {
      return e;
    } else {
      return AppException(exceptionMessage: e.toString(), stack: stack);
    }
  }

  String? message = 'AppException with empty message';
  StackTrace? stackTrace;

  @override
  String toString() {
    // stack and message return
    return message.toString();
    // return '$message';
  }
}

class ApiException extends AppException {
  ApiException({String? message}) : super(exceptionMessage: message);
}

class UnauthorizedException extends AppException {
  UnauthorizedException({String? message}) : super(exceptionMessage: message);
}

class InternetNotConnectedException extends AppException {
  InternetNotConnectedException()
      : super(
            exceptionMessage: 'İnternet bağlantınızı kontrol ediniz');
}

class UnexpectedErrorException extends AppException {
  UnexpectedErrorException([String? message])
      : super(
            exceptionMessage:
                message ?? 'Beklenmedik bir hata oluştu');
}

class ServiceConnectionException extends AppException {
  ServiceConnectionException({Exception? mainException, String? message})
      : super(
          exception: mainException,
          exceptionMessage:
              message ?? 'Servis bağlantısı kurulamadı. Lütfen tekrar deneyiniz.'
        );
}
