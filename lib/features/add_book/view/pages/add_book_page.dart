import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/add_book/controllers/image_picker_controller.dart';
import 'package:litera_app/features/add_book/view/widgets/book_image_picker_widget.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _formKey = GlobalKey<FormState>();

  // 1. Inisialisasi controller untuk gambar
  final _imagePickerController = ImagePickerController();

  // Controller untuk setiap form field
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _publisherController = TextEditingController();
  final _yearController = TextEditingController();
  final _pagesController = TextEditingController();
  final _priceController = TextEditingController();
  final _isbnController = TextEditingController();

  @override
  void dispose() {
    // 2. Panggil dispose pada semua controller
    _imagePickerController.dispose();
    _titleController.dispose();
    _authorController.dispose();
    _publisherController.dispose();
    _yearController.dispose();
    _pagesController.dispose();
    _priceController.dispose();
    _isbnController.dispose();
    super.dispose();
  }
  
  // Helper widget untuk membuat form field agar tidak repetitif
  // Kode ini sekarang sudah lengkap dan tidak akan menyebabkan error null.
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Pallete.textGrayColor)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          // Batasi input hanya angka untuk field yang relevan
          inputFormatters: keyboardType == TextInputType.number
              ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
              : null,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Pallete.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Pallete.primaryColor, width: 2),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$label tidak boleh kosong';
            }
            return null;
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Buku'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 3. Gunakan widget baru yang reusable
              BookImagePickerWidget(controller: _imagePickerController),
              
              const SizedBox(height: 24),
              _buildTextField(controller: _titleController, label: 'Judul Buku'),
              const SizedBox(height: 16),
              _buildTextField(controller: _authorController, label: 'Pengarang'),
              const SizedBox(height: 16),
              _buildTextField(controller: _publisherController, label: 'Penerbit'),
              const SizedBox(height: 16),
              _buildTextField(controller: _yearController, label: 'Tahun Terbit', keyboardType: TextInputType.number),
              const SizedBox(height: 16),
              _buildTextField(controller: _pagesController, label: 'Halaman', keyboardType: TextInputType.number),
              const SizedBox(height: 16),
              _buildTextField(controller: _priceController, label: 'Harga sewa perhari', keyboardType: TextInputType.number),
              const SizedBox(height: 16),
              _buildTextField(controller: _isbnController, label: 'ISBN'),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // 4. Update validasi untuk menggunakan controller
                    if (_imagePickerController.image.value == null) {
                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Foto buku wajib diisi.')));
                       return;
                    }
                    if (_formKey.currentState!.validate()) {
                      // TODO: Logika upload dan simpan data
                      print('Form valid. Siap untuk disimpan!');
                      print('Path Gambar: ${_imagePickerController.image.value!.path}');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Pallete.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}