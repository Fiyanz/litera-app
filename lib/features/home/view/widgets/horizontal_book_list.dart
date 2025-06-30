import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/home/model/home_book_item_data.dart';
import 'package:litera_app/features/home/view/widgets/book_item.dart';

class HorizontalBookList extends StatelessWidget {
  final String sectionTitle;
  // PERBAIKAN 2: Ganti tipe data list menjadi HomeBookItemData
  final List<HomeBookItemData> books; 

  const HorizontalBookList({
    super.key,
    required this.sectionTitle,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Judul Sesi
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
          height: 230, // Tinggi sudah sesuai untuk BookItem
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemBuilder: (context, index) {
              final bookData = books[index]; // Variabel ini sekarang bertipe HomeBookItemData
              return Padding(
                padding: const EdgeInsets.only(right: 12.0),
                // PERBAIKAN 3: Kirim 'bookData' ke parameter 'bookData' di BookItem
                child: BookItem(bookData: bookData),
              );
            },
          ),
        ),
      ],
    );
  }
}