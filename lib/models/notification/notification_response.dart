class NotificationResponse {
  NotificationResponse(
      {required this.id,
      required this.senderUserId,
      required this.receiverUserId,
      required this.messageId,
      required this.createdAt,
      required this.isSent,
      required this.isRead,
      required this.message,
      this.updatedAt,
      this.deletedAt});

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      id: json['id'] as int,
      senderUserId: json['sender_user_id'] as int,
      receiverUserId: json['receiver_user_id'] as int,
      messageId: json['message_id'] as int,
      isSent: json['is_sent'] as int,
      isRead: json['is_read'] as int,
      message: MessageResponse.fromJson(json['message'] as Map<String, dynamic>),
      //TODO: add message
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
    );
  }

  final int id;
  final int senderUserId;
  final int receiverUserId;
  final int messageId;
  final MessageResponse message;
  final int isSent;
  final int isRead;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;

}

class MessageResponse {
  MessageResponse({
    required this.id,
    required this.senderUserId,
    required this.channelId,
    required this.message,
    this.thumbnail,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,});

  factory MessageResponse.fromJson(Map<String, dynamic> json) {
    return MessageResponse(
      id: json['id'] as int,
      senderUserId: json['sender_user_id'] as int,
      channelId: json['channel_id'] as int,
      message: json['message'] as String,
      thumbnail: json['thumbnail'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
    );
  }

  final int id;
  final int senderUserId;
  final int channelId;
  final String message;
  final String? thumbnail;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;

}
