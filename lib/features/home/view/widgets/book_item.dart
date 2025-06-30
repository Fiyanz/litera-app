// lib/features/home/view/widgets/book_item.dart
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/book_detail/view/pages/book_detail_page.dart';
import 'package:litera_app/features/home/model/home_book_item_data.dart'; // <-- IMPORT MODEL BARU

class BookItem extends StatelessWidget {
  // PERBAIKAN 1: Gunakan model HomeBookItemData
  final HomeBookItemData bookData;

  const BookItem({super.key, required this.bookData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // PERBAIKAN 2: Navigasi ke BookDetailPage dengan mengirim semua data yang benar
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailPage(
              bookId: bookData.bookId,
              ownerId: bookData.ownerId,
              pricePerDay: bookData.pricePerDay,
              imageUrls: bookData.imageUrls,
              bookInfo: bookData.bookInfo,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: bookData.displayImageUrl.isNotEmpty
                    ? Image.network(
                        bookData.displayImageUrl, // Gunakan data dari model
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) => _buildErrorPlaceholder(),
                      )
                    : _buildErrorPlaceholder(),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              bookData.title, // Gunakan data dari model
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Pallete.textColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              bookData.author, // Gunakan data dari model
              style: const TextStyle(
                fontSize: 12,
                color: Pallete.textGrayColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorPlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: Pallete.secondaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: const Center(
        child: Icon(
          Icons.book_outlined,
          color: Pallete.textGrayColor,
          size: 40,
        ),
      ),
    );
  }
}