// lib/features/bookmark/view/widgets/bookmarked_book_item.dart
import 'package:flutter/material.dart';
import 'package:litera_app/features/book_detail/view/pages/book_detail_page.dart';
import 'package:litera_app/features/bookmark/models/book_info.dart';


class BookmarkedBookItem extends StatelessWidget {
  final BookmarkedItemData bookData;

  const BookmarkedBookItem({super.key, required this.bookData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // PERBAIKAN: Navigasi ke BookDetailPage dengan mengirim semua data yang dibutuhkan
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                bookData.displayImageUrl, // Gunakan data dari model
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image, size: 48, color: Colors.grey);
                },
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            bookData.title, // Gunakan data dari model
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}