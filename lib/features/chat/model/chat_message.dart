class ChatMessage {
  final String id, text, senderId;
  final DateTime timestamp;
  ChatMessage({ required this.id, required this.text, required this.senderId, required this.timestamp });
}