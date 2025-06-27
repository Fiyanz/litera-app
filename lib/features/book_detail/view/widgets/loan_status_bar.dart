import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart'; // Import Pallete Anda

class LoanStatusBar extends StatelessWidget {
  const LoanStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Pallete.primaryLightColor, // Menggunakan Pallete
        borderRadius: BorderRadius.circular(30),
        // Anda mungkin perlu menambahkan warna border yang lebih terang ke Pallete
        border: Border.all(color: Colors.grey.shade300), 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildInfoItem(Icons.history_rounded, '15x dipinjam'),
          _buildVerticalDivider(),
          _buildInfoItem(Icons.price_change_outlined, 'Rp. 500/hari'),
          _buildVerticalDivider(),
          _buildAuthorItem(
            // Ganti dengan URL gambar profil penulis/penerbit
            'https://placehold.co/40x40/EFEFEF/AAAAAA&text=K',
            'Kanye',
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    // Anda mungkin perlu menambahkan warna divider ke Pallete
    return Container(
      height: 24,
      width: 1,
      color: Colors.grey.shade300,
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Pallete.textGrayColor, size: 20), // Menggunakan Pallete
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontSize: 12, color: Pallete.textColor)), // Menggunakan Pallete
      ],
    );
  }
  
  Widget _buildAuthorItem(String imageUrl, String name) {
    return Row(
      children: [
         CircleAvatar(
          radius: 12,
          backgroundImage: NetworkImage(imageUrl),
           onBackgroundImageError: (exception, stackTrace) {},
        ),
        const SizedBox(width: 6),
        Text(name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Pallete.textColor)), // Menggunakan Pallete
      ],
    );
  }
}
