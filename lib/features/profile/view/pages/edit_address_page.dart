import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart'; 
import 'package:litera_app/features/profile/viewmodel/profile_viewmodel.dart';
import 'package:provider/provider.dart';

class EditAddressPage extends StatelessWidget {
  const EditAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ProfileViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alamat Baru'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildAddressForm(viewModel),
            const SizedBox(height: 24),
            _buildSaveButton(context, viewModel),
          ],
        ),
      ),
    );
  }

  // Widget Form utama
  Widget _buildAddressForm(ProfileViewModel viewModel) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField(label: 'Nama Lengkap', controller: viewModel.fullNameController),
            _buildTextField(label: 'Nomor Telepon', controller: viewModel.phoneController, keyboardType: TextInputType.phone),
            _buildTextField(label: 'Provinsi', controller: viewModel.provinceController),
            _buildTextField(label: 'Kota', controller: viewModel.cityController),
            _buildTextField(label: 'Kecamatan', controller: viewModel.districtController),
            _buildTextField(label: 'Kode Pos', controller: viewModel.postalCodeController, keyboardType: TextInputType.number),
            _buildTextField(label: 'Detail Lainnya', controller: viewModel.addressDetailsController, maxLines: 3),
          ],
        ),
      ),
    );
  }

  // Tombol Simpan
  Widget _buildSaveButton(BuildContext context, ProfileViewModel viewModel) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => viewModel.saveAddress(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Pallete.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: const Text('Simpan', style: TextStyle(fontSize: 18, color: Pallete.primaryLightColor)),
      ),
    );
  }
  
  // Helper widget untuk membuat TextField dengan rapi
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        ),
      ),
    );
  }
}