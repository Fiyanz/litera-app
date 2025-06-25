// Sesuaikan path import ini
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'book_item.dart';

class BookGrid extends StatelessWidget {
  const BookGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> bookTitles = List.generate(6, (index) => 'Judul');

    return Container(
      color: Pallete.primaryLightColor, // Menggunakan warna dari Pallete
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Buku yang sering dipinjam',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Pallete.textColor, // Menggunakan warna dari Pallete
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
              itemCount: bookTitles.length,
              itemBuilder: (context, index) {
                return BookItem(title: bookTitles[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}