import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerController {
  File? selectedImage;

  /// Callback untuk memberi tahu UI ketika gambar berhasil dipilih
  Function(File)? onImagePicked;

  Future<void> pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      if (onImagePicked != null) {
        onImagePicked!(selectedImage!); // panggil callback
      }
    }
  }
}
