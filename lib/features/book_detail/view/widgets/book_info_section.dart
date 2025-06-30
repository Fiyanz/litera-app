// lib/features/book_detail/view/widgets/book_info_section.dart
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/book_detail/model/book_info.dart'; // <-- IMPORT MODEL BARU

class BookInfoSection extends StatelessWidget {
  // PERBAIKAN 1: Widget ini sekarang menerima objek BookInfo
  final BookInfo bookInfo;

  const BookInfoSection({super.key, required this.bookInfo});

  @override
  Widget build(BuildContext context) {
    // PERBAIKAN 2: Hapus data hardcode. Kita akan gunakan data dari widget.bookInfo

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          // PERBAIKAN 3: Tampilkan data secara eksplisit dari model
          _buildDetailRow('Judul buku', bookInfo.title),
          _buildDetailRow('Pengarang', bookInfo.author),
          _buildDetailRow('Penerbit', bookInfo.publisher),
          _buildDetailRow('Tahun Terbit', bookInfo.yearPublished),
          _buildDetailRow('Halaman', bookInfo.pageCount),
          _buildDetailRow('ISBN', bookInfo.isbn),
          _buildDetailRow('Kategori Buku', bookInfo.category),
          _buildDetailRow('Alamat', bookInfo.address),
        ],
      ),
    );
  }

  // Helper widget _buildDetailRow tidak perlu diubah, sudah bagus.
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(color: Pallete.textGrayColor),
            ),
          ),
          const Text(': ', style: TextStyle(color: Pallete.textGrayColor)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500, color: Pallete.textColor),
            ),
          ),
        ],
      ),
    );
  }
}