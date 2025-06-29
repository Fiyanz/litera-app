import 'package:flutter/material.dart';
import 'package:litera_app/core/models/book_model.dart';

class BookmarkViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Book> _bookmarkedBooks = [];
  List<Book> get bookmarkedBooks => _bookmarkedBooks;

  BookmarkViewModel() {
    fetchBookmarkedBooks();
  }

  Future<void> fetchBookmarkedBooks() async {
    _isLoading = true;
    notifyListeners();

    // Simulasi pengambilan data dari database atau API
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy sesuai dengan gambar
    _bookmarkedBooks = [
      Book(id: '1', title: 'Serangkai', author: 'Valerie Patkar', imageUrls: ['https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1660183307l/61884323.jpg']),
      Book(id: '2', title: 'The Alpha Girl\'s Guide', author: 'Henry Manampiring', imageUrls: ['https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1435286940l/25817290.jpg']),
      Book(id: '3', title: 'Rumah Lebah', author: 'Ruwi Meita', imageUrls: ['https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1645363493l/60455802.jpg']),
      Book(id: '4', title: 'Bulan', author: 'Tere Liye', imageUrls: ['https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1478183215l/32812440._SY475_.jpg']),
      Book(id: '5', title: 'Insecurity', author: 'Alvi Syahrin', imageUrls: ['https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1592628421l/54228972.jpg']),
      Book(id: '6', title: 'Laut Bercerita', author: 'Leila S. Chudori', imageUrls: ['https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1508219649l/36431949.jpg']),
      Book(id: '7', title: 'Bagaimana Demokrasi Mati', author: 'Steven Levitsky', imageUrls: ['https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1551448834l/43329938.jpg']),
      Book(id: '8', title: 'Dasar Ilmu Politik', author: 'Miriam Budiardjo', imageUrls: ['https://images.tokopedia.net/img/cache/700/product-1/2019/6/24/3990426/3990426_1c27778b-593b-466d-88b9-873d6d061525_1500_1500.jpg']),
      Book(id: '9', title: 'Merayakan Kehilangan', author: 'Brian Khrisna', imageUrls: ['https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1531236116l/40812580.jpg']),
    ];

    _isLoading = false;
    notifyListeners();
  }
}