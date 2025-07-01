import 'dart:io';
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart'; // Sesuaikan path

class BookImagePickerWidget extends StatelessWidget {
  final File? image;
  final VoidCallback onTap;

  const BookImagePickerWidget({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Foto Buku*', style: TextStyle(fontSize: 14, color: Pallete.textGrayColor)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 120,
            height: 160,
            decoration: BoxDecoration(
              border: Border.all(color: Pallete.borderColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(image!, fit: BoxFit.cover),
                  )
                : const Center(
                    child: Icon(Icons.camera_alt_outlined, size: 40, color: Pallete.textGrayColor),
                  ),
          ),
        ),
      ],
    );
  }
}