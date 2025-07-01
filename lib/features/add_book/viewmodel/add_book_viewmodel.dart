import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:litera_app/features/add_book/models/book_model.dart'; // Sesuaikan path

class AddBookViewModel extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController isbnController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController publisherController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController pagesController = TextEditingController();

  // State
  File? _selectedImage;
  String? _selectedCategory;
  final List<String> categories = ['Fiksi', 'Non-Fiksi'];

  // Getters
  File? get selectedImage => _selectedImage;
  String? get selectedCategory => _selectedCategory;

  // Setters & Logic
  void setCategory(String? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      _selectedImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  void saveBook(BuildContext context) {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Foto buku wajib diisi.')),
      );
      return;
    }

    if (formKey.currentState!.validate() && _selectedCategory != null) {
      final newBook = BookModel(
        isbn: isbnController.text,
        title: titleController.text,
        author: authorController.text,
        publisher: publisherController.text,
        year: int.tryParse(yearController.text) ?? 0,
        price: double.tryParse(priceController.text) ?? 0.0,
        pages: int.tryParse(pagesController.text) ?? 0,
        category: _selectedCategory!,
        imageFile: _selectedImage!,
      );

      // TODO: Logika untuk upload gambar dan menyimpan data ke database/API
      print('Buku baru siap disimpan: ${newBook.title} - ${newBook.category}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Buku berhasil disimpan!')),
      );
    } else if (_selectedCategory == null) {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kategori wajib dipilih.')),
      );
    }
  }

  @override
  void dispose() {
    isbnController.dispose();
    titleController.dispose();
    authorController.dispose();
    publisherController.dispose();
    yearController.dispose();
    priceController.dispose();
    pagesController.dispose();
    super.dispose();
  }
}