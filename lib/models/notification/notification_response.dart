class NotificationResponse {
  NotificationResponse(
      {required this.id,
      required this.senderUserId,
      required this.receiverUserId,
      required this.messageId,
      required this.createdAt,
      required this.isSent,
      required this.isRead,
      this.updatedAt,
      this.deletedAt});

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      id: json['id'] as String,
      senderUserId: json['sender_user_id'] as String,
      receiverUserId: json['receiver_user_id'] as String,
      messageId: json['message_id'] as String,
      isSent: json['is_sent'] as bool,
      isRead: json['is_read'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
    );
  }

  final String id;
  final String senderUserId;
  final String receiverUserId;
  final String messageId;
  final bool isSent;
  final bool isRead;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;

}
