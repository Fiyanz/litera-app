import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController {
  final ImagePicker _picker = ImagePicker();
  final ValueNotifier<File?> image = ValueNotifier(null);

  Future<void> pickImageFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (pickedFile != null) {
        image.value = File(pickedFile.path);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  /// FIX 1: TAMBAHKAN METHOD INI
  /// Membersihkan state controller saat sudah tidak digunakan.
  void dispose() {
    image.dispose();
  }
}