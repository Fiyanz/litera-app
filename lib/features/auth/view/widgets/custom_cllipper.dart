import 'package:flutter/material.dart';

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height); // dari kiri atas ke kiri bawah

    // lengkung "gunung"
    path.quadraticBezierTo(
      size.width / 2, size.height - 100, // titik puncak gunung
      size.width, size.height, // ke kanan bawah
    );

    path.lineTo(size.width, 0); // ke kanan atas
    path.close(); // tutup path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
