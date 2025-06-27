
class Message {
  final String text;
  final bool isMe; // Untuk menentukan apakah pengirimnya adalah pengguna saat ini
  final DateTime timestamp;

  Message({
    required this.text,
    required this.isMe,
    required this.timestamp,
  });
}