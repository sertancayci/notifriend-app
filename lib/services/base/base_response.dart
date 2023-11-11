class BaseResponse<T> {
  BaseResponse({ this.success, this.message, this.data, this.errors});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object json) fromJsonT,
  ) {
    T? data;
    if (json['data'] != null) {
      if (json['data'] is String) {
        data = fromJsonT(json['data'] as String);
      } else if (json['data'] is int) {
        data = fromJsonT(json['data'] as int);
      } else if (json['data'] is double) {
        data = fromJsonT(json['data'] as double);
      } else if (json['data'] is Map<String, dynamic>) {
        data = fromJsonT(json['data'] as Map<String, dynamic>);
      } else if (json['data'] is List<dynamic>) {
        data = fromJsonT(json['data'] as List<dynamic>);
      }
    }

    return BaseResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: data,
    );
  }

  final T? data;
  final bool? success;
  final String? message;
  final List<ErrorResponse>? errors;
// final String? message;
}

class ErrorResponse {
  ErrorResponse({
    required this.message,
    this.code,
    this.errorCode,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      message: json['message'] as String,
      code: json['code'] != null ? json['code'] as int : null,
      errorCode: json['errorCode'] != null ? json['errorCode'] as int : null,
    );
  }

  final String message;
  final int? code;
  final int? errorCode;
}
