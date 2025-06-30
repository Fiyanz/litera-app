// lib/features/bookmark/viewmodel/bookmark_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:litera_app/features/book_detail/model/book_info.dart';
import 'package:litera_app/features/bookmark/models/book_info.dart';

class BookmarkViewModel extends ChangeNotifier {
  
  List<BookmarkedItemData> _bookmarkedBooks = [];
  List<BookmarkedItemData> get bookmarkedBooks => _bookmarkedBooks;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchBookmarks() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); // Simulasi API

    // --- PERBAIKAN UTAMA DI SINI ---
    // Ganti URL gambar dengan yang berfungsi dari ui-avatars.com
    _bookmarkedBooks = [
      BookmarkedItemData(
        bookId: 'bk_123', ownerId: 'pemilik_789', pricePerDay: 1000,
        // PERBAIKAN URL:
        imageUrls: ['https://ui-avatars.com/api/?name=Bumi+Manusia&size=250&background=random&color=fff&font-size=0.3'],
        bookInfo: BookInfo(title: 'Bumi Manusia', author: 'Pramoedya Ananta Toer', publisher: 'Hasta Mitra', yearPublished: '1980', pageCount: '535', isbn: '979-8659-10-5', category: 'Fiksi Sejarah', address: 'Jl. Merdeka No. 45, Bandung'),
      ),
      BookmarkedItemData(
        bookId: 'bk_456', ownerId: 'pemilik_123', pricePerDay: 500,
        // PERBAIKAN URL:
        imageUrls: ['https://ui-avatars.com/api/?name=Laut+Bercerita&size=250&background=random&color=fff&font-size=0.3'],
        bookInfo: BookInfo(title: 'Laut Bercerita', author: 'Leila S. Chudori', publisher: 'KPG', yearPublished: '2017', pageCount: '379', isbn: '978-602-424-694-5', category: 'Fiksi', address: 'Jl. Raya No. 123, Jakarta'),
      ),
      // Anda bisa tambahkan buku lain yang di-bookmark di sini
    ];

    _isLoading = false;
    notifyListeners();
  }
}