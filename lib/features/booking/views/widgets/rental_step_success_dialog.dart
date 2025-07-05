import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';

class RentalStepSuccessDialog extends StatelessWidget {
  const RentalStepSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          // Ganti dengan gambar atau ikon yang sesuai
          Image.network(
            'https://i.ibb.co/L5hKDDd/handshake-icon.png', // Contoh URL gambar handshake
            width: 80,
          ),
          const SizedBox(height: 16),
          const Text(
            'Penyewaan selesai',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Sampai ketemu di pinjaman berikutnya! 👋',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(), // Tutup dialog
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Oke', style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ),
        ],
      ),
      contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
    );
  }
}