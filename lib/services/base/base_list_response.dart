class BaseListResponse<T> {
  BaseListResponse({
    required this.currentPage,
    required this.pageCount,
    required this.perPage,
    required this.totalCount,
    this.data,
  });

  factory BaseListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object json) fromJsonT,
  ) {
    List<T>? data;
    if (json['data'] != null) {
      data = (json['data'] as List<dynamic>).map((e) {
        return fromJsonT(e);
      }).toList();
    }
    // if (json['data'] != null ) {
    //   data = (json['data'] as List<dynamic>).map((e) {
    //     if (e is int)
    //       return e as T;
    //     else
    //       return fromJsonT(e as Map<String, dynamic>);
    //   })
    //       // fromJsonT(e as Map<String, dynamic>); })
    //       .toList(); //fromJsonT(json['data'] as List<dynamic>);
    // }

    return BaseListResponse(
      currentPage: json['meta']['current_page'] as int,
      pageCount: json['meta']['last_page'] as int,
      perPage: json['meta']['per_page'] as int,
      totalCount: json['meta']['total'] as int,
      data: data,
    );
  }

  final int currentPage;
  final int pageCount;
  final int perPage;
  final int totalCount;
  final List<T>? data;
}

