import 'package:flutter/material.dart';
import 'package:litera_app/core/models/book_model.dart';

class HomeViewModel extends ChangeNotifier {
  // ... (properti lain tidak berubah)
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Book> _popularBooks = [];
  List<Book> get popularBooks => _popularBooks;
  List<Book> _recommendedBooks = [];
  List<Book> get recommendedBooks => _recommendedBooks;
  List<Book> _newReleaseBooks = [];
  List<Book> get newReleaseBooks => _newReleaseBooks;


  HomeViewModel() {
    fetchAllBookLists();
  }


  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchAllBookLists() async {
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 2));

    _popularBooks = [
      // Buku dengan 3 gambar
      Book(
        id: '1',
        title: 'Laut Bercerita',
        author: 'Leila S. Chudori',
        // PERBAIKAN: Gunakan 'imageUrls' dengan List<String>
        imageUrls: [
          'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1518613149l/38591242.jpg',
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1666624933l/63013414.jpg',
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1518613149i/38591242.jpg',
        ],
      ),
      // Buku dengan 1 gambar
      Book(
        id: '2',
        title: 'Bumi Manusia',
        author: 'Pramoedya A. Toer',
        // PERBAIKAN: Gunakan 'imageUrls' dengan List<String>
        imageUrls: [
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1559828538l/1852199.jpg'
        ],
      ),
      Book(
        id: '2',
        title: 'Bumi Manusia',
        author: 'Pramoedya A. Toer',
        // PERBAIKAN: Gunakan 'imageUrls' dengan List<String>
        imageUrls: [
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1559828538l/1852199.jpg'
        ],
      ),
      Book(
        id: '2',
        title: 'Bumi Manusia',
        author: 'Pramoedya A. Toer',
        // PERBAIKAN: Gunakan 'imageUrls' dengan List<String>
        imageUrls: [
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1559828538l/1852199.jpg'
        ],
      ),
    ];

    _recommendedBooks = [
      Book(
        id: '4',
        title: 'Pulang',
        author: 'Tere Liye',
        imageUrls: ['https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1447943553l/27834785.jpg']
      ),
    ];

    _newReleaseBooks = [
       Book(
        id: '6',
        title: 'Kitab Kawin',
        author: 'Laksmi Pamuntjak',
        imageUrls: ['https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1675765694l/63032791.jpg']
       ),
    ];
    
    _setLoading(false);
  }
  Future<Map<String, List<String>>> fetchFilterOptions() async {
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 1)); 

    final Map<String, List<String>> filterData = {
      'years': ['2025', '2024', '2023', '2022', '2021'],
      'locations': ['Jakarta', 'Surabaya', 'Bandung', 'Yogyakarta'],
      'categories': ['Fiksi', 'Non-Fiksi', 'Sains', 'Sejarah', 'Biografi'],
    };
    
    _setLoading(false);
    return filterData;
  }
}