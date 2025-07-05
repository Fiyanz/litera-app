// lib/features/home/viewmodel/home_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:litera_app/features/book_detail/model/book_info.dart';
import 'package:litera_app/features/home/model/home_book_item_data.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // PERBAIKAN 3: Ganti tipe data semua list menjadi HomeBookItemData
  List<HomeBookItemData> _popularBooks = [];
  List<HomeBookItemData> get popularBooks => _popularBooks;

  List<HomeBookItemData> _recommendedBooks = [];
  List<HomeBookItemData> get recommendedBooks => _recommendedBooks;

  List<HomeBookItemData> _newReleaseBooks = [];
  List<HomeBookItemData> get newReleaseBooks => _newReleaseBooks;

  HomeViewModel() {
    // Panggil method fetch data saat ViewModel pertama kali dibuat
    fetchAllBookLists();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchAllBookLists() async {
    _setLoading(true);
    // Simulasi jeda untuk mengambil data dari API
    await Future.delayed(const Duration(seconds: 2));

    _popularBooks = [
      HomeBookItemData(
        bookId: 'bk_123', ownerId: 'pemilik_789', pricePerDay: 1000,
        // GANTI URL INI
        imageUrls: ['https://ui-avatars.com/api/?name=Bumi+Manusia&size=250&background=random&color=fff&font-size=0.3'],
        bookInfo: BookInfo(title: 'Bumi Manusia', author: 'Pramoedya A. Toer', publisher: 'Hasta Mitra', yearPublished: '1980', pageCount: '535', isbn: '979-8659-10-5', category: 'Fiksi Sejarah', address: 'Jl. Merdeka No. 45, Bandung'),
      ),
      HomeBookItemData(
        bookId: 'bk_789', ownerId: 'pemilik_987', pricePerDay: 1200,
        // GANTI URL INI
        imageUrls: ['https://ui-avatars.com/api/?name=Pulang&size=250&background=random&color=fff&font-size=0.3'],
        bookInfo: BookInfo(title: 'Pulang', author: 'Tere Liye', publisher: 'Republika', yearPublished: '2015', pageCount: '400', isbn: '978-602-082-212-9', category: 'Fiksi', address: 'Jl. Sudirman No. 1, Jakarta'),
      ),
    ];

    _recommendedBooks = [
       HomeBookItemData(
        bookId: 'bk_456', ownerId: 'pemilik_123', pricePerDay: 500,
        // GANTI URL INI
        imageUrls: ['https://ui-avatars.com/api/?name=Laut+Bercerita&size=250&background=random&color=fff&font-size=0.3'],
        bookInfo: BookInfo(title: 'Laut Bercerita', author: 'Leila S. Chudori', publisher: 'KPG', yearPublished: '2017', pageCount: '379', isbn: '978-602-424-694-5', category: 'Fiksi', address: 'Jl. Raya No. 123, Jakarta'),
      ),
    ];
    
    _newReleaseBooks = [
      HomeBookItemData(
        bookId: 'bk_654', ownerId: 'pemilik_456', pricePerDay: 1500,
        // GANTI URL INI
        imageUrls: ['https://ui-avatars.com/api/?name=Kitab+Kawin&size=250&background=random&color=fff&font-size=0.3'],
        bookInfo: BookInfo(title: 'Kitab Kawin', author: 'Laksmi Pamuntjak', publisher: 'Gramedia', yearPublished: '2023', pageCount: '500', isbn: '978-602-065-225-8', category: 'Antologi', address: 'Jl. Gajah Mada No. 10, Semarang'),
      ),
    ];
    
    notifyListeners();
    _setLoading(false);
  }

  Future<Map<String, List<String>>> fetchFilterOptions() async {
    _setLoading(true);
    await Future.delayed(const Duration(milliseconds: 800)); 

    final Map<String, List<String>> filterData = {
      'years': ['2025', '2024', '2023', '2022', '2021'],
      'locations': ['Surabaya', 'Jakarta', 'Bandung', 'Yogyakarta'],
      'categories': ['Fiksi', 'Non-Fiksi'],
    };
    
    _setLoading(false);
    return filterData;
  }
}