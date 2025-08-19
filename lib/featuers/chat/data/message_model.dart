class MessageModel {
  final String message;
  final DateTime time;
  final bool isRead;
  final bool isMe;

  MessageModel({
    required this.message,
    required this.time,
    this.isRead = false,
    required this.isMe,
  });
}
