// lib/features/home/model/book_model.dart

/// Kelas [Book] merepresentasikan model data untuk sebuah buku.
/// Ini digunakan di seluruh aplikasi untuk menjaga konsistensi data.
class Book {
  final String id;
  final String title;
  final String author;
  final String imageUrl;
  // Anda bisa menambahkan properti lain di sini sesuai kebutuhan,
  // seperti sinopsis, penerbit, tahun terbit, dll.

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
  });
}
