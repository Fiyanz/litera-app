import 'dart:io';
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/add_book/controllers/image_picker_controller.dart';

class BookImagePickerWidget extends StatelessWidget {
  final ImagePickerController controller;

  const BookImagePickerWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Foto Buku*', style: TextStyle(fontSize: 14, color: Pallete.textGrayColor)),
        const SizedBox(height: 8),
        // ValueListenableBuilder akan secara otomatis memperbarui UI saat gambar di controller berubah.
        ValueListenableBuilder<File?>(
          valueListenable: controller.image,
          builder: (context, selectedImage, child) {
            return GestureDetector(
              onTap: () => controller.pickImageFromGallery(),
              child: Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  border: Border.all(color: Pallete.borderColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: selectedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(selectedImage, fit: BoxFit.cover),
                      )
                    : const Center(
                        child: Icon(Icons.camera_alt_outlined, size: 40, color: Pallete.textGrayColor),
                      ),
              ),
            );
          },
        ),
      ],
    );
  }
}