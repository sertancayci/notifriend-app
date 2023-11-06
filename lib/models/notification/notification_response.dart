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
      id: json['id'] as int,
      senderUserId: json['sender_user_id'] as int,
      receiverUserId: json['receiver_user_id'] as int,
      messageId: json['message_id'] as int,
      isSent: json['is_sent'] as int,
      isRead: json['is_read'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
    );
  }

  final int id;
  final int senderUserId;
  final int receiverUserId;
  final int messageId;
  final int isSent;
  final int isRead;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;

}
