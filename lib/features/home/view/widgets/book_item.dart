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
        Navigator.push(
          context,
          MaterialPageRoute(
            // Nanti kita akan aktifkan pengiriman data buku
            builder: (context) => const BookDetailPage(/* book: book */),
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
                // Pastikan kita menggunakan book.imageUrl
                child: Image.network(
                  book.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  // Ini adalah errorBuilder yang akan menangani jika gambar gagal dimuat
                  // Ini akan menampilkan placeholder, BUKAN membuat aplikasi crash.
                  errorBuilder: (context, error, stackTrace) {
                    // Tambahkan print untuk membantu debug jika ada gambar yang error
                    print("🚫 Gagal memuat gambar: ${book.imageUrl}");
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
                  },
                ),
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
}
