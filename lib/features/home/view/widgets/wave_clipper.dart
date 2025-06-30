// lib/features/home/view/widgets/wave_clipper.dart
import 'package:flutter/material.dart';

/// Sebuah [CustomClipper] yang menciptakan bentuk gelombang di bagian bawah sebuah widget.
///
/// Widget ini biasa digunakan bersama `ClipPath` untuk memotong (clip) sebuah
/// Container atau widget lain, memberikan efek visual header yang melengkung.
class WaveClipper extends CustomClipper<Path> {
  
  /// Method ini mendefinisikan bentuk path (jalur) yang akan digunakan untuk memotong.
  @override
  Path getClip(Size size) {
    // 'size' adalah ukuran dari widget yang akan dipotong.
    // 'path' adalah objek yang kita gunakan untuk "menggambar" bentuk potongan.
    var path = Path();

    // 1. Mulai dari pojok kiri atas (0,0), tarik garis lurus ke bawah
    //    sampai sedikit di atas bagian bawah widget (size.height - 50).
    path.lineTo(0, size.height - 50);

    // 2. Gambar kurva pertama (lengkungan pertama).
    //    Ini adalah kurva Bezier kuadratik yang membutuhkan satu titik kontrol
    //    dan satu titik akhir untuk menciptakan lengkungan.
    var firstControlPoint = Offset(size.width / 4, size.height); // Titik kontrol di bawah untuk membuat lekukan ke atas.
    var firstEndPoint = Offset(size.width / 2.2, size.height - 30.0); // Titik akhir kurva pertama.
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    // 3. Gambar kurva kedua (lengkungan kedua).
    //    Ini menciptakan bagian kedua dari gelombang.
    var secondControlPoint = Offset(size.width - (size.width / 3.25), size.height - 65); // Titik kontrol kedua.
    var secondEndPoint = Offset(size.width, size.height - 40); // Titik akhir kurva kedua di sisi kanan.
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    // 4. Tarik garis lurus dari titik akhir kurva ke pojok kanan atas (size.width, 0).
    path.lineTo(size.width, 0);

    // 5. Tutup path kembali ke titik awal (0,0) untuk menyelesaikan bentuk.
    path.close();
    
    return path;
  }

  /// Method ini menentukan apakah clipper perlu menggambar ulang path-nya.
  /// Karena bentuk gelombang kita statis, kita kembalikan `false` untuk optimasi performa.
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}