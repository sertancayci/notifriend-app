class BaseListResponse<T> {
  BaseListResponse({
    required this.currentPage,
    required this.pageCount,
    required this.pageSize,
    required this.rowCount,
    required this.totalPages,
    required this.showPrevious,
    required this.showNext,
    this.results,
  });

  factory BaseListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object json) fromJsonT,
  ) {
    List<T>? results;
    if (json['results'] != null) {
      results = (json['results'] as List<dynamic>).map((e) {
        if (e is int)
          return e as T;
        else
          return fromJsonT(e as Map<String, dynamic>);
      })
          // fromJsonT(e as Map<String, dynamic>); })
          .toList(); //fromJsonT(json['data'] as List<dynamic>);
    }

    return BaseListResponse(
      currentPage: json['currentPage'] as int,
      pageCount: json['pageCount'] as int,
      pageSize: json['pageSize'] as int,
      rowCount: json['rowCount'] as int,
      totalPages: json['totalPages'] as int,
      showPrevious: json['showPrevious'] as bool,
      showNext: json['showNext'] as bool,
      results: results,
    );
  }

  final int currentPage;
  final int pageCount;
  final int pageSize;
  final int rowCount;
  final int totalPages;
  final bool showPrevious;
  final bool showNext;
  final List<T>? results;
}
//
// BaseListResponse<T> baseResponseFromJson<T>(
//     Map<String, dynamic> json, T Function(Object)? fromJsonT) {
//   T? data;
//   if (fromJsonT != null && json['data'] != null) {
//     data = fromJsonT(json['data'] as Map<String, dynamic>);
//   } else if (fromJsonT != null) {
//     data = fromJsonT(json);
//   }
//   return BaseListResponse(
//     isSuccess: json['isSuccess'] as bool,
//     resultType: json['resultType'] as int,
//     message: (json['message'] != null && isNotBlank(json['message'] as String))
//         ? json['message'] as String
//         : null,
//     data: data,
//   );
// }
