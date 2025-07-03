enum HistoryStatus { dipinjam, selesai, terlambat }

class HistoryModel {
  final String id;
  final String bookTitle;
  final String bookAuthor;
  final String bookImageUrl;
  final String borrowerName;
  final DateTime borrowDate;
  final DateTime returnDate;
  final double price;
  final HistoryStatus status;

  HistoryModel({
    required this.id,
    required this.bookTitle,
    required this.bookAuthor,
    required this.bookImageUrl,
    required this.borrowerName,
    required this.borrowDate,
    required this.returnDate,
    required this.price,
    required this.status,
  });
}