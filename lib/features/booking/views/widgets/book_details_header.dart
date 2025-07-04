import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import '../../models/booking_model.dart';

class BookDetailsHeader extends StatelessWidget {
  final BookingModel details;
  const BookDetailsHeader({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            details.bookImageUrl,
            width: 100,
            height: 150,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 100,
                height: 150,
                color: Colors.grey.shade200,
                child: const Icon(Icons.book_outlined),
              );
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(details.bookTitle, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(details.bookAuthor, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              const SizedBox(height: 8),
              Text(details.isbn, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              Text(details.year, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 8),
              Text(
                '${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(details.pricePerDay)}/Hari',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Pallete.primaryColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}