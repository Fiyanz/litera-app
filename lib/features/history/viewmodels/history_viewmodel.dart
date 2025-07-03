import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import '../models/history_model.dart';

class HistoryViewModel extends ChangeNotifier {
  int _selectedFilterIndex = 0;
  int get selectedFilterIndex => _selectedFilterIndex;

  late List<HistoryModel> _allHistoryItems;
  List<HistoryModel> get filteredHistoryItems {
    if (_selectedFilterIndex == 0) {
      return _allHistoryItems; // Tampilkan semua
    }
    // Filter berdasarkan status yang dipilih
    final status = HistoryStatus.values[_selectedFilterIndex - 1];
    return _allHistoryItems.where((item) => item.status == status).toList();
  }

  // Helper untuk format tanggal
  String formatDateRange(DateTime start, DateTime end) {
    return '${DateFormat('dd MMM yyyy', 'id_ID').format(start)} - ${DateFormat('dd MMM yyyy', 'id_ID').format(end)}';
  }

  // Helper untuk format harga
  String formatPrice(double price) {
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(price);
  }

  HistoryViewModel() {
    _fetchHistoryData();
  }

  void changeFilter(int index) {
    _selectedFilterIndex = index;
    notifyListeners();
  }

  void _fetchHistoryData() {
    _allHistoryItems = [
      HistoryModel(
          id: '1',
          bookTitle: 'Laut Bercerita',
          bookAuthor: 'Leila S. Chudori',
          bookImageUrl: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1509938833l/36423046.jpg',
          borrowerName: 'Kanye',
          borrowDate: DateTime(2025, 5, 8),
          returnDate: DateTime(2025, 5, 23),
          price: 10500,
          status: HistoryStatus.selesai),
      HistoryModel(
          id: '2',
          bookTitle: 'Laut Bercerita',
          bookAuthor: 'Leila S. Chudori',
          bookImageUrl: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1509938833l/36423046.jpg',
          borrowerName: 'Kanye',
          borrowDate: DateTime(2025, 5, 8),
          returnDate: DateTime(2025, 5, 23),
          price: 10500,
          status: HistoryStatus.dipinjam),
      HistoryModel(
          id: '3',
          bookTitle: 'Laut Bercerita',
          bookAuthor: 'Leila S. Chudori',
          bookImageUrl: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1509938833l/36423046.jpg',
          borrowerName: 'Kanye',
          borrowDate: DateTime(2025, 5, 8),
          returnDate: DateTime(2025, 5, 23),
          price: 10500,
          status: HistoryStatus.terlambat),
    ];
  }
}