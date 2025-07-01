// lib/features/add_book/models/book_model.dart

import 'dart:io';

class BookModel {
  final String isbn;
  final String title;
  final String author;
  final String publisher;
  final int year;
  final double price;
  final int pages;
  final String category;
  final File? imageFile; // File gambar yang akan di-upload

  BookModel({
    required this.isbn,
    required this.title,
    required this.author,
    required this.publisher,
    required this.year,
    required this.price,
    required this.pages,
    required this.category,
    this.imageFile,
  });

  // Anda bisa menambahkan method toJson() di sini untuk konversi ke JSON saat mengirim ke API
  Map<String, dynamic> toJson() {
    return {
      'isbn': isbn,
      'title': title,
      'author': author,
      'publisher': publisher,
      'year': year,
      'price': price,
      'pages': pages,
      'category': category,
    };
  }
}