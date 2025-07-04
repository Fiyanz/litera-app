class BookingModel {
  // Detail Buku
  final String bookTitle;
  final String bookAuthor;
  final String bookImageUrl;
  final String isbn;
  final String year;
  final double pricePerDay;

  // Detail Pemilik
  final String ownerName;
  final String ownerImageUrl;
  final String ownerLocation;

  // Detail Peminjaman
  final DateTime startDate;
  final int durationDays;
  final DateTime endDate;
  final double totalPrice;

  BookingModel({
    required this.bookTitle,
    required this.bookAuthor,
    required this.bookImageUrl,
    required this.isbn,
    required this.year,
    required this.pricePerDay,
    required this.ownerName,
    required this.ownerImageUrl,
    required this.ownerLocation,
    required this.startDate,
    required this.durationDays,
    required this.endDate,
    required this.totalPrice,
  });
}