import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart'; // Sesuaikan path

class LogoutConfirmationDialog extends StatelessWidget {
  // Callback untuk dieksekusi saat tombol "Iya, Logout" ditekan
  final VoidCallback onConfirm;

  const LogoutConfirmationDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          const Icon(Icons.error, color: Pallete.errorColor, size: 60),
          const SizedBox(height: 16),
          const Text(
            'Logout?',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Apakah kamu yakin ingin Logout?',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),
          // Tombol Konfirmasi
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                onConfirm(); // Jalankan fungsi logout
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.errorColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Iya, Logout', style: TextStyle(fontSize: 16, color: Pallete.primaryLightColor)),
            ),
          ),
          const SizedBox(height: 8),
          // Tombol Batal
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.of(context).pop(), // Hanya tutup dialog
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade300),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Tidak, Batal', style: TextStyle(fontSize: 16, color: Pallete.textGrayColor)),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
      contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      actionsPadding: EdgeInsets.zero,
    );
  }
}