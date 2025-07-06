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

    await Future.delayed(const Duration(seconds: 1)); 

    _bookmarkedBooks = [
      BookmarkedItemData(
        bookId: 'bk_138', 
        ownerId: 'pemilik_808', 
        pricePerDay: 22000,
        imageUrls: ['https://cdn.gramedia.com/uploads/items/The_Kite_Runner.jpg'],
        bookInfo: BookInfo(
          title: 'The Kite Runner', 
          author: 'Khaled Hosseini', 
          publisher: 'Gramedia', 
          yearPublished: '2019', 
          pageCount: '371', 
          isbn: '978-979-22-5022-6', 
          category: 'Fiksi Filosofis', 
          address: 'Jl. Sultan Iskandar Muda No. 90, Jakarta Barat'
        ),
      ),
      BookmarkedItemData(
        bookId: 'bk_139', 
        ownerId: 'pemilik_809', 
        pricePerDay: 30000,
        imageUrls: ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWAx7Gj-ZCgsO8GjurC2UNoYnIRhIZth6OnA&s'],
        bookInfo: BookInfo(
          title: 'Filsafat untuk Pemula', 
          author: 'Richard Osborne', 
          publisher: 'Narasi', 
          yearPublished: '2023', 
          pageCount: '288', 
          isbn: '978-623-7586-88-3', 
          category: 'Filsafat', 
          address: 'Jl. Cihampelas No. 25, Bandung'
        ),
      ),
      // Anda bisa tambahkan buku lain yang di-bookmark di sini
    ];

    _isLoading = false;
    notifyListeners();
  }
}