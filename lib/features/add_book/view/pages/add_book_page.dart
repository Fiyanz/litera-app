import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:litera_app/features/add_book/viewmodel/add_book_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:litera_app/core/theme/app_pallete.dart'; // Sesuaikan path
import 'package:litera_app/features/add_book/view/widgets/book_image_picker_widget.dart'; // Sesuaikan path
import 'package:litera_app/features/add_book/view/widgets/category_dropdown_widget.dart'; // Sesuaikan path

class AddBookPage extends StatelessWidget {
  const AddBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddBookViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Buku'),
          centerTitle: true,
        ),
        body: Consumer<AddBookViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookImagePickerWidget(
                      image: viewModel.selectedImage,
                      onTap: viewModel.pickImage,
                    ),
                    const SizedBox(height: 24),
                    _buildTextField(controller: viewModel.isbnController, label: 'ISBN'),
                    const SizedBox(height: 16),
                    _buildTextField(controller: viewModel.titleController, label: 'Judul Buku'),
                    const SizedBox(height: 16),
                    _buildTextField(controller: viewModel.authorController, label: 'Pengarang'),
                    const SizedBox(height: 16),
                    _buildTextField(controller: viewModel.publisherController, label: 'Penerbit'),
                    const SizedBox(height: 16),
                    _buildTextField(controller: viewModel.yearController, label: 'Tahun Terbit', keyboardType: TextInputType.number),
                    const SizedBox(height: 16),
                    _buildTextField(controller: viewModel.priceController, label: 'Harga sewa perhari', keyboardType: TextInputType.number),
                    const SizedBox(height: 16),
                    _buildTextField(controller: viewModel.pagesController, label: 'Jumlah Halaman', keyboardType: TextInputType.number),
                    const SizedBox(height: 16),
                    CategoryDropdownWidget(
                      selectedValue: viewModel.selectedCategory,
                      items: viewModel.categories,
                      onChanged: (newValue) => viewModel.setCategory(newValue),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => viewModel.saveBook(context),
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
            );
          },
        ),
      ),
    );
  }

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
}