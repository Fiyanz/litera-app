import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart'; // Sesuaikan path
import 'package:litera_app/features/notification/models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: Pallete.primaryLightColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Pallete.secondaryColor.withOpacity(0.2),
            ),
            child: const Icon(Icons.swap_horiz, color: Pallete.primaryColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  notification.body,
                  style: const TextStyle(color: Pallete.textGrayColor, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}