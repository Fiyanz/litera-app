import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart'; 
import 'package:litera_app/core/models/book_model.dart';
import 'package:litera_app/features/home/view/widgets/book_item.dart';

class HorizontalBookList extends StatelessWidget {
  final String sectionTitle;
  final List<Book> books; 

  const HorizontalBookList({
    super.key,
    required this.sectionTitle,
    required this.books, // Widget ini sekarang membutuhkan daftar buku
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Judul Sesi (misal: "Buku yang sering dipinjam")
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Text(
            sectionTitle,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Pallete.textColor, 
            ),
          ),
        ),
        // List Buku Horizontal
        SizedBox(
          height: 230, // Sedikit menambah tinggi untuk mengakomodasi teks penulis
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length, // 5. Gunakan panjang dari list buku yang sebenarnya
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemBuilder: (context, index) {
              final book = books[index]; // Ambil objek buku saat ini
              // Kita beri jarak antar item buku di sini
              return Padding(
                padding: const EdgeInsets.only(right: 12.0),
                // 6. Kirim seluruh objek 'book' ke BookItem
                child: BookItem(book: book),
              );
            },
          ),
        ),
      ],
    );
  }
}
