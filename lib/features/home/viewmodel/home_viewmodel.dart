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
        imageUrls: ['https://tokbuk.com/wp-content/uploads/2025/02/Bumi-Manusia.jpg'],
        bookInfo: BookInfo(title: 'Bumi Manusia', author: 'Pramoedya A. Toer', publisher: 'Hasta Mitra', yearPublished: '1980', pageCount: '535', isbn: '979-8659-10-5', category: 'Fiksi', address: 'Jl. Merdeka No. 45, Bandung'),
      ),
      HomeBookItemData(
        bookId: 'bk_789', ownerId: 'pemilik_987', pricePerDay: 1200,
        // GANTI URL INI
        imageUrls: ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpD9eeA1d4fyEWp5IL9QE649kpRdRgzcLj8g&s'],
        bookInfo: BookInfo(
          title: 'Pulang', 
          author: 'Tere Liye', 
          publisher: 'Republika', 
          yearPublished: '2015', 
          pageCount: '400', 
          isbn: '978-602-082-212-9', 
          category: 'Fiksi', 
          address: 'Jl. Sudirman No. 1, Jakarta',
        ),
      ),
      HomeBookItemData(
        bookId: 'bk_125', 
        ownerId: 'pemilik_791', 
        pricePerDay: 2000,
        imageUrls: ['https://cdn.gramedia.com/uploads/picture_meta/2024/1/8/m5b3gwzj4fpaxwq7lk4b9s.jpg'],
        bookInfo: BookInfo(
          title: 'Madilog', 
          author: 'Tan Malaka', 
          publisher: 'Komunitas Bambu', 
          yearPublished: '2017', 
          pageCount: '448', 
          isbn: '978-602-6469-51-4', 
          category: 'Non-Fiksi', 
          address: 'Jl. Salemba Raya No. 72, Jakarta Pusat'
        ),
      ),
      HomeBookItemData(
        bookId: 'bk_126', 
        ownerId: 'pemilik_792', 
        pricePerDay: 120000,
        imageUrls: ['https://cdn.gramedia.com/uploads/items/Biografi_Karl_Marx.jpg'],
        bookInfo: BookInfo(
          title: 'Biografi Karl Marx', 
          author: 'Isaiah Berlin', 
          publisher: 'Narasi', 
          yearPublished: '2021', 
          pageCount: '444', 
          isbn: '978-623-7586-41-8', 
          category: 'Filsafat Politik', 
          address: 'Jl. Sudirman No. 88, Jakarta Selatan'
        ),
      ),

    ];

    _recommendedBooks = [
       HomeBookItemData(
        bookId: 'bk_456', ownerId: 'pemilik_123', pricePerDay: 500,
        // GANTI URL INI
        imageUrls: ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKGZdWun3X0ikBpjhOTuQhKTraNrSlk_22VQ&s'],
        bookInfo: BookInfo(title: 'Laut Bercerita', author: 'Leila S. Chudori', publisher: 'KPG', yearPublished: '2017', pageCount: '379', isbn: '978-602-424-694-5', category: 'Fiksi', address: 'Jl. Raya No. 123, Jakarta'),
      ),
      HomeBookItemData(
        bookId: 'bk_130', 
        ownerId: 'pemilik_800', 
        pricePerDay: 15000,
        imageUrls: ['https://cdn.gramedia.com/uploads/products/cw9e-i53wo.jpg'],
        bookInfo: BookInfo(
          title: 'Norwegian Wood', 
          author: 'Haruki Murakami', 
          publisher: 'Gramedia Pustaka Utama', 
          yearPublished: '2020', 
          pageCount: '380', 
          isbn: '978-602-06-3601-4', 
          category: 'Fiksi Jepang', 
          address: 'Jl. Thamrin No. 10, Jakarta Pusat'
        ),
      ),
      HomeBookItemData(
        bookId: 'bk_131', 
        ownerId: 'pemilik_801', 
        pricePerDay: 25000,
        imageUrls: ['https://assets-a1.kompasiana.com/items/album/2024/01/05/img-20221227-012311-350-63afca894addee49a508d4e2-6597b3e912d50f423b7c1e62.jpg'],
        bookInfo: BookInfo(
          title: 'Dunia Sophie', 
          author: 'Jostein Gaarder', 
          publisher: 'Narasi', 
          yearPublished: '2021', 
          pageCount: '448', 
          isbn: '978-623-7586-11-1', 
          category: 'Filsafat', 
          address: 'Jl. Diponegoro No. 22, Surabaya'
        ),
      ),
      HomeBookItemData(
        bookId: 'bk_133', 
        ownerId: 'pemilik_803', 
        pricePerDay: 210000,
        imageUrls: ['https://elib.ubb.ac.id/lib/minigalnano/createthumb.php?filename=images/docs/cover_sejarah_filsafat_barat.jpg&width=200'],
        bookInfo: BookInfo(
          title: 'Sejarah Filsafat Barat', 
          author: 'Bertrand Russell', 
          publisher: 'Gramedia', 
          yearPublished: '2018', 
          pageCount: '656', 
          isbn: '978-979-22-9877-8', 
          category: 'Filsafat', 
          address: 'Jl. Raya Bogor No. 77, Depok'
        ),
      ),
      HomeBookItemData(
        bookId: 'bk_135', 
        ownerId: 'pemilik_805', 
        pricePerDay: 35000,
        imageUrls: ['https://cdn.gramedia.com/uploads/picture_meta/2023/11/27/kjf6cgigkomf6sy9o5qauu.jpg'],
        bookInfo: BookInfo(
          title: 'Filosofi Teras', 
          author: 'Henry Manampiring', 
          publisher: 'BukuKita', 
          yearPublished: '2020', 
          pageCount: '312', 
          isbn: '978-623-95500-0-1', 
          category: 'Filsafat', 
          address: 'Jl. Sudirman No. 88, Jakarta Selatan'
        ),
      ),
    ];
    
    _newReleaseBooks = [
      HomeBookItemData(
        bookId: 'bk_654', ownerId: 'pemilik_456', pricePerDay: 1500,
        // GANTI URL INI
        imageUrls: ['https://gpu.id/data-gpu/images/img-book/94181/623221028.jpg'],
        bookInfo: BookInfo(title: 'how to win friends and influence people', author: 'Laksmi Pamuntjak', publisher: 'Gramedia', yearPublished: '2023', pageCount: '500', isbn: '978-602-065-225-8', category: 'Antologi', address: 'Jl. Gajah Mada No. 10, Semarang'),
      ),
      HomeBookItemData(
        bookId: 'bk_132', 
        ownerId: 'pemilik_802', 
        pricePerDay: 12000,
        imageUrls: ['https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1679448171i/123412030.jpg'],
        bookInfo: BookInfo(
          title: 'Kokoro', 
          author: 'Natsume Soseki', 
          publisher: 'Pustaka Alvabet', 
          yearPublished: '2019', 
          pageCount: '320', 
          isbn: '978-602-6469-33-0', 
          category: 'Fiksi Jepang', 
          address: 'Jl. Ahmad Yani No. 5, Medan'
        ),
      ),
      HomeBookItemData(
        bookId: 'bk_134', 
        ownerId: 'pemilik_804', 
        pricePerDay: 18000,
        imageUrls: ['https://cdn.kyou.id/items/94006-kadokawa-bunko-light-novel-kimi-no-na-wa-shinkai-makoto.jpg'],
        bookInfo: BookInfo(
          title: 'Your Name', 
          author: 'Makoto Shinkai', 
          publisher: 'Elex Media Komputindo', 
          yearPublished: '2022', 
          pageCount: '256', 
          isbn: '978-623-00-1234-5', 
          category: 'Fiksi Jepang', 
          address: 'Jl. Gajah Mada No. 15, Bandung'
        ),
      ),
      HomeBookItemData(
        bookId: 'bk_136', 
        ownerId: 'pemilik_806', 
        pricePerDay: 14000,
        imageUrls: ['https://tonysreadinglist.wordpress.com/wp-content/uploads/2024/01/keene.jpg'],
        bookInfo: BookInfo(
          title: 'No Longer Human', 
          author: 'Osamu Dazai', 
          publisher: 'Gramedia Pustaka Utama', 
          yearPublished: '2021', 
          pageCount: '192', 
          isbn: '978-602-06-4567-2', 
          category: 'Fiksi Jepang', 
          address: 'Jl. Merdeka No. 33, Semarang'
        ),
      ),
      HomeBookItemData(
        bookId: 'bk_137', 
        ownerId: 'pemilik_807', 
        pricePerDay: 45000,
        imageUrls: ['https://umsupress.umsu.ac.id/wp-content/uploads/2024/08/Book-Chapter-Filsafat-Ilmu-.png'],
        bookInfo: BookInfo(
          title: 'Filsafat Ilmu', 
          author: 'Welhendri Azwar', 
          publisher: 'Gramedia', 
          yearPublished: '2022', 
          pageCount: '368', 
          isbn: '978-602-06-5678-4', 
          category: 'Filsafat', 
          address: 'Jl. Pahlawan No. 12, Yogyakarta'
        ),
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