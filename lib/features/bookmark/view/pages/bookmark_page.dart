// lib/features/bookmark/view/pages/bookmark_page.dart
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/bookmark/view/widgets/bookmarked_book_item.dart';
import 'package:litera_app/features/bookmark/viewmodel/bookmark_viewmodel.dart';
import 'package:provider/provider.dart';

// PERBAIKAN 1: Ubah menjadi StatefulWidget
class BookmarkPage extends StatefulWidget {
  // PERBAIKAN 2: Hapus parameter dari constructor. Halaman ini tidak butuh data dari luar.
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {

  @override
  void initState() {
    super.initState();
    // PERBAIKAN 3: Panggil method untuk mengambil data saat halaman pertama kali dibuka.
    // 'listen: false' penting di dalam initState.
    // Kita gunakan Future.microtask untuk memastikan context sudah siap saat dipanggil.
    Future.microtask(() {
      Provider.of<BookmarkViewModel>(context, listen: false).fetchBookmarks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined, size: 28),
          ),
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      // Consumer akan "mendengarkan" perubahan dari BookmarkViewModel
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
              crossAxisCount: 3,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.55,
            ),
            itemCount: viewModel.bookmarkedBooks.length,
            itemBuilder: (context, index) {
              final book = viewModel.bookmarkedBooks[index];
              return BookmarkedBookItem(bookData: book);
            },
          );
        },
      ),
    );
  }
}