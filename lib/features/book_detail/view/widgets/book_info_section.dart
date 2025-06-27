import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart'; // Import Pallete Anda

class BookInfoSection extends StatelessWidget {
  const BookInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Data ini seharusnya datang dari model buku Anda
    final bookDetails = {
      'Judul buku': 'Laut Bercerita',
      'Pengarang': 'Leila S. Chudori',
      'Penerbit': 'Kepustakaan Populer Gramedia',
      'Tahun Terbit': '2017',
      'Halaman': '379',
      'ISBN': '978-602-424-694-5',
      'Kategori Buku': 'Fiksi',
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: bookDetails.entries.map((entry) {
          return _buildDetailRow(entry.key, entry.value);
        }).toList(),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120, // Lebar tetap untuk label
            child: Text(
              label,
              style: const TextStyle(color: Pallete.textGrayColor), // Menggunakan Pallete
            ),
          ),
          const Text(': ', style: TextStyle(color: Pallete.textGrayColor)), // Menggunakan Pallete
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500, color: Pallete.textColor), // Menggunakan Pallete
            ),
          ),
        ],
      ),
    );
  }
}
