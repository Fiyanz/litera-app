import 'package:flutter/material.dart';
import '../../models/history_model.dart';

class StatusBadge extends StatelessWidget {
  final HistoryStatus status;
  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    // Tentukan warna, ikon, dan teks berdasarkan status
    Color backgroundColor;
    Color foregroundColor;
    IconData iconData;
    String text;

    switch (status) {
      case HistoryStatus.selesai:
        backgroundColor = Colors.green.shade100;
        foregroundColor = Colors.green.shade800;
        iconData = Icons.check_circle;
        text = 'Selesai';
        break;
      case HistoryStatus.dipinjam:
        backgroundColor = Colors.blue.shade100;
        foregroundColor = Colors.blue.shade800;
        iconData = Icons.access_time_filled;
        text = 'Dipinjam';
        break;
      case HistoryStatus.terlambat:
        backgroundColor = Colors.red.shade100;
        foregroundColor = Colors.red.shade800;
        iconData = Icons.error;
        text = 'Terlambat';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color: foregroundColor, size: 14),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(color: foregroundColor, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }
}