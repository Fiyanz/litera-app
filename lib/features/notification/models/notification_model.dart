enum NotificationType { keuangan, tawaran, buku }

class NotificationModel {
  final String id;
  final String title;
  final String body;
  final NotificationType type;
  final DateTime createdAt;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.createdAt,
    this.isRead = false,
  });
}