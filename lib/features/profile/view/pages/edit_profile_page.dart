import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/profile/viewmodel/profile_viewmodel.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Terhubung dengan ProfileViewModel yang sudah ada
    final viewModel = context.watch<ProfileViewModel>();

    return Scaffold(
      backgroundColor: Pallete.primaryLightColor,
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Pallete.primaryLightColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header dengan gambar profil
            _buildHeader(viewModel.user?.profileImageUrl),

            // Form untuk data pengguna
            _buildProfileForm(context, viewModel),

            // Tombol Simpan
            _buildSaveButton(context, viewModel),
          ],
        ),
      ),
    );
  }

    // Helper widget baru untuk field yang bisa diedit
  Widget _buildEditableTextField({
    required String label,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 120, // Lebar tetap untuk label
            child: Text(label, style: const TextStyle(fontSize: 16, color: Pallete.textGrayColor)),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 16, color: Pallete.textColor, fontWeight: FontWeight.w500),
              decoration: const InputDecoration(
                isDense: true,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget untuk data yang tidak bisa diedit (saat ini)
  Widget _buildInfoRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, color: Pallete.textGrayColor)),
          Text(value, style: const TextStyle(fontSize: 16, color: Pallete.textColor, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildProfileForm(BuildContext context, ProfileViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildEditableTextField(label: 'Nama', controller: viewModel.nameController),
          _buildEditableTextField(label: 'Username', controller: viewModel.usernameController),
          _buildInfoRow(label: 'Jenis Kelamin', value: viewModel.user?.gender ?? '-'),
          _buildInfoRow(label: 'Tanggal Lahir', value: viewModel.user?.birthDate ?? '-'),
          _buildInfoRow(label: 'Email', value: viewModel.emailController.text),
        ],
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context, ProfileViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          // Panggil method saveProfile dari ViewModel
          onPressed: () => viewModel.saveProfile(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: const Text('Simpan', style: TextStyle(fontSize: 18, color: Pallete.primaryLightColor)),
        ),
      ),
    );
  }

  Widget _buildHeader(String? imageUrl) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        color: Pallete.backgroundColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
                child: imageUrl == null ? const Icon(Icons.person, size: 50) : null,
              ),
              // Tambahkan "Ubah" di bawah gambar
              Transform.translate(
                offset: const Offset(0, 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: Pallete.primaryLightColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: const Text(
                    'Ubah',
                    style: TextStyle(color: Pallete.primaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}