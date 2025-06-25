// Sesuaikan path import ini
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'wave_clipper.dart';

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        width: double.infinity,
        color: Pallete.backgroundColor, // Menggunakan warna dari Pallete
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 60.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo!',
              style: TextStyle(
                color: Pallete.primaryLightColor, // Menggunakan warna dari Pallete
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Yuk, cari buku favoritmu di sini.',
              style: TextStyle(
                color: Pallete.primaryLightColor, // Menggunakan warna dari Pallete
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}