import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/bookmark/view/widgets/bookmarked_book_item.dart';
import 'package:litera_app/features/bookmark/viewmodel/bookmark_viewmodel.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Kita gunakan ChangeNotifierProvider di sini jika belum disediakan di atasnya
    // Namun, cara terbaik adalah menyediakannya di main.dart
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bookmark',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Aksi untuk notifikasi
            },
            icon: const Icon(Icons.notifications_none_outlined, size: 28),
          ),
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Consumer<BookmarkViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Pallete.primaryColor),
            );
          }

          if (viewModel.bookmarkedBooks.isEmpty) {
            return const Center(
              child: Text('Anda belum memiliki buku yang di-bookmark.'),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,        // 3 kolom
              crossAxisSpacing: 16.0,   // Jarak horizontal antar item
              mainAxisSpacing: 16.0,    // Jarak vertikal antar item
              childAspectRatio: 0.55,   // Rasio lebar/tinggi item
            ),
            itemCount: viewModel.bookmarkedBooks.length,
            itemBuilder: (context, index) {
              final book = viewModel.bookmarkedBooks[index];
              return BookmarkedBookItem(book: book);
            },
          );
        },
      ),
    );
  }
}