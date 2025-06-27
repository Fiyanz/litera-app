import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/book_detail/view/pages/book_detail_page.dart';
import 'package:litera_app/core/models/book_model.dart';

class BookItem extends StatelessWidget {
  final Book book;

  const BookItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman detail dengan mengirim seluruh objek buku
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailPage(book: book),
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
                // PERBAIKAN: Ambil gambar pertama dari list
                // Tambahkan pengecekan untuk menghindari error jika list kosong
                child: book.imageUrls.isNotEmpty
                    ? Image.network(
                        book.imageUrls.first, // Ambil elemen pertama
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return _buildErrorPlaceholder();
                        },
                      )
                    : _buildErrorPlaceholder(), // Tampilkan placeholder jika tidak ada gambar
              ),
            ),
            const SizedBox(height: 8),
            Text(
              book.title,
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
              book.author,
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

  // Widget helper untuk placeholder jika gambar error atau tidak ada
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