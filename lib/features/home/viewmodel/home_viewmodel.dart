import 'package:flutter/material.dart';
import 'package:litera_app/core/models/book_model.dart';

class HomeViewModel extends ChangeNotifier {
  // Tambahkan log di constructor untuk melihat kapan ViewModel dibuat
  HomeViewModel() {
    print("✅ [HomeViewModel] Berhasil Dibuat!");
    // Kita juga bisa langsung panggil fetch di sini agar lebih pasti
    fetchAllBookLists();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Book> _popularBooks = [];
  List<Book> get popularBooks => _popularBooks;

  List<Book> _recommendedBooks = [];
  List<Book> get recommendedBooks => _recommendedBooks;
  
  List<Book> _newReleaseBooks = [];
  List<Book> get newReleaseBooks => _newReleaseBooks;

  Map<String, List<String>> _filterData = {};
  Map<String, List<String>> get filterData => _filterData;


  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchAllBookLists() async {
    print("🔄 [HomeViewModel] Memulai fetchAllBookLists...");
    _setLoading(true);
    
    // Simulasi pengambilan data dari API
    await Future.delayed(const Duration(seconds: 2));

    // Data dummy untuk contoh
    _popularBooks = [
      Book(id: '1', title: 'Laut Bercerita', author: 'Leila S. Chudori', imageUrl: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1518613149l/38591242.jpg'),
      Book(id: '2', title: 'Bumi Manusia', author: 'Pramoedya A. Toer', imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1559828538l/1852199.jpg'),
      Book(id: '3', title: 'Cantik Itu Luka', author: 'Eka Kurniawan', imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1442953893l/25983398.jpg'),
    ];
    
    _recommendedBooks = [
       Book(id: '4', title: 'Pulang', author: 'Tere Liye', imageUrl: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1447943553l/27834785.jpg'),
       Book(id: '5', title: 'Gadis Kretek', author: 'Ratih Kumala', imageUrl: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1668565170l/12894371.jpg'),
    ];

    _newReleaseBooks = [
       Book(id: '6', title: 'Kitab Kawin', author: 'Laksmi Pamuntjak', imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1675765694l/63032791.jpg'),
       Book(id: '7', title: 'Orang-Orang Biasa', author: 'Andrea Hirata', imageUrl: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1553482566l/44602019.jpg'),
    ];

    print("✅ [HomeViewModel] Data buku berhasil dimuat. Jumlah buku populer: ${_popularBooks.length}");
    print("🔔 [HomeViewModel] Memanggil notifyListeners() untuk update UI...");
    _setLoading(false); // ini akan memanggil notifyListeners()
  }

  // Method untuk filter dialog (sudah ada di kode Anda)
  Future<void> fetchFilterOptions() async {
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    _filterData = {
      'years': ['2023', '2022', '2021', '2020'],
      'locations': ['Jakarta', 'Surabaya', 'Bandung'],
      'categories': ['Fiksi', 'Non-Fiksi', 'Sains', 'Sejarah'],
    };
    _setLoading(false);
  }
}
