class ChatModel {
  final String name;
  final String message;
  final String time;
  final String imageUrl;
  final bool isMe;
  final bool isRead;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.imageUrl,
    required this.isMe,
    required this.isRead,
  });
}
