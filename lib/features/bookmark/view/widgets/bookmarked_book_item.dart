import 'package:flutter/material.dart';
import 'package:litera_app/core/models/book_model.dart';
import 'package:litera_app/features/book_detail/view/pages/book_detail_page.dart'; // Import halaman detail

class BookmarkedBookItem extends StatelessWidget {
  final Book book;

  const BookmarkedBookItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke BookDetailPage saat item diklik
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailPage(book: book),
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
                book.imageUrls.isNotEmpty ? book.imageUrls[0] : '',
                fit: BoxFit.cover,
                // Tampilkan loading indicator saat gambar dimuat
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                // Tampilkan ikon error jika gambar gagal dimuat
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image, size: 48, color: Colors.grey);
                },
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            book.title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}