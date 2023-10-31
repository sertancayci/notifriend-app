
import 'package:intl/intl.dart';
import 'package:notifriend/services/base/base_response.dart';

extension ErrorResponseList on List<ErrorResponse> {
  String get message {
    return map((e) => e.message).join('\n');
  }
}

extension StringExtension on String {
  String get formatServicePhoneNumberFormat {
    String number = replaceAll(RegExp('[^0-9]'), '');
    if (number.length == 12) {
      number = number.substring(2, number.length);
    }
    return '$number';
  }

  DateTime get from_yyyMMddy {
    var dateFormat = DateFormat('yyyy-MM-dd').parse(this);
    return dateFormat;
  }

  DateTime get from_ddMMyyyy {
    var dateFormat = DateFormat('dd.MM.yyyy').parse(this);
    return dateFormat;
  }
}

extension DateTimeExtension on DateTime {
  String get to_ddMMyyyy {
    var dateFormat = DateFormat('dd.MM.yyyy').format(this);
    return dateFormat;
  }

  String get to_yyyMMdd {
    var dateFormat = DateFormat('yyyy-MM-dd').format(this);
    return dateFormat;
  }
}

extension StringListJoinExtension on List<String> {
  String joinWithSeparator(String separator) {
    return where((value) => value != null && value.isNotEmpty).join(separator);
  }
}
