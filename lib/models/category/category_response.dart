class CategoryResponse {
  CategoryResponse({
    required this.id,
    required this.name,
    required this.slug,
    required this.thumbnail,
    required this.status,
  });

  final int id;
  final String name;
  final String slug;
  final String thumbnail;
  final String status;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
      thumbnail: json["thumbnail"],
      status: json["status"],
    );
  }
}
