import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart'; // Import Pallete Anda

class ActionButtonsBar extends StatelessWidget {
  const ActionButtonsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Padding untuk memastikan tidak terlalu mepet ke tepi layar
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Row(
        children: [
          // Bookmark Button
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Pallete.borderColor), // Menggunakan Pallete
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(Icons.bookmark_border_rounded, size: 28, color: Pallete.textGrayColor), // Menggunakan Pallete
              onPressed: () {
                // TODO: Implement bookmark functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Buku ditambahkan ke bookmark!')),
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          
          // Loan Button
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Pallete.primaryColor, // Menggunakan Pallete
                foregroundColor: Pallete.primaryLightColor, // Menggunakan Pallete
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                // TODO: Implement loan functionality
                 ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Memproses peminjaman buku...')),
                );
              },
              child: const Text('Pinjam Buku', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
