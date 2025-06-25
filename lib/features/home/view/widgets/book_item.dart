// Sesuaikan path import ini
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';

class BookItem extends StatelessWidget {
  final String title;

  const BookItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              // Menggunakan secondaryColor sebagai placeholder cover buku
              color: Pallete.secondaryColor.withOpacity(0.5), 
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Pallete.textColor, // Menggunakan warna dari Pallete
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}