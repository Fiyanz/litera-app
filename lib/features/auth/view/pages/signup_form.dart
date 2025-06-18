import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/auth/controller/image_picker_controller.dart';
import 'package:litera_app/features/auth/view/widgets/auth_button.dart';
import 'package:litera_app/features/auth/view/widgets/custom_field.dart';
import 'dart:io';


class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final nikController = TextEditingController();
  final nameController = TextEditingController();
  final birthDateController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nikController.dispose();
    nameController.dispose();
    birthDateController.dispose();
    genderController.dispose();
    addressController.dispose();
  }
  
  // Controller for image picking
  final ImagePickerController _imagePickerController = ImagePickerController();
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _imagePickerController.onImagePicked = (image) {
      setState(() {
        _selectedImage = image;
      });
    };
  }

  void _handleImagePick() {
    _imagePickerController.pickImageFromGallery();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Daftar Akun',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Pallete.textColor, // Use your theme's text color
                ),
              ),
              Column(
                children: [
                  const Text(
                    'Pastikan Foto dan Informasi KTP kamu sesuai',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Pallete.textColor,
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: _handleImagePick,
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: _selectedImage == null
                      ? const Center(
                          child: Icon(Icons.camera_alt_outlined, size: 40, color: Colors.black54),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.file(
                            _selectedImage!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _handleImagePick,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal, // Ganti sesuai Pallete.primaryColor jika ada
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    child: const Text(
                      'Upload',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
        
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'NIK',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Pallete.textColor, // Use your theme's text color
                  )
                ),
              ),
              CustomField(
                hitText: '',
                controller: nikController, // Use the controller for NIK
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nama Sesuai KTP',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Pallete.textColor, // Use your theme's text color
                  )
                ),
              ),
              CustomField(
                hitText: '',
                controller: nameController, // Use the controller for name
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tanggal Lahir',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Pallete.textColor, // Use your theme's text color
                  )
                ),
              ),
              CustomField(
                hitText: '',
                controller: birthDateController, // Use the controller for birth date
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Jenis Kelamin',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Pallete.textColor, // Use your theme's text color
                  )
                ),
              ),
              CustomField(
                hitText: '',
                controller: genderController, // Use the controller
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Alamat Sesuai KTP',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Pallete.textColor, // Use your theme's text color
                  )
                ),
              ),
              CustomField(
                hitText: '',
                controller: addressController, // Use the controller for address
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(value: false, onChanged: (_) {}),
                  const Text(
                    'Saya memastikan keaslian informasi\ndi atas dan bersedia bertanggung \njawab secara hukum jika ada indikasi \natau tindakan pemalsuan.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Pallete.textColor, // Use your theme's text color
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              AuthButton(),
            ],
          ),
        ),
      ),
    );
  }
}