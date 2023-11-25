class ChannelResponse {
  ChannelResponse(
      {required this.id,
      required this.userId,
      required this.categoryId,
      required this.title,
      required this.description,
      this.thumbnail,
      required this.status,
      required this.createdAt,
      required this.owner,
      this.updatedAt,
      this.deletedAt});

  factory ChannelResponse.fromJson(Map<String, dynamic> json) {
    return ChannelResponse(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      categoryId: json['category_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      thumbnail: json['thumbnail'] as String?,
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      owner: OwnerResponse.fromJson(json['owner'] as Map<String, dynamic>),
    );
  }

  final int id;
  final int userId;
  final int categoryId;
  final String title;
  final String description;
  final String? thumbnail;
  final String status;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final OwnerResponse owner;
}

class OwnerResponse {
  OwnerResponse({
    required this.id,
    required this.name,
    required this.email,
    this.username,
    this.avatar,
    required this.status,
    this.token,
  });

  final int id;
  final String name;
  final String email;
  final String? username;
  final String? avatar;
  final String status;
  final String? token;

  factory OwnerResponse.fromJson(Map<String, dynamic> json) {
    return OwnerResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      status: json['status'] as String,
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
      token: json['token'] as String?,
    );
  }
}
